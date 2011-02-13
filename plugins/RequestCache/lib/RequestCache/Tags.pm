package RequestCache::Tags;
use strict;

# <MTRequestCacheBlock key="RecentEntries" blog_id="$blog_id">
#     Some template tags here.
# </MTRequestCacheBlock>

sub _hdlr_request_cache {
    my ( $ctx, $args, $cond ) = @_;
    require MT::Request;
    my $key = $args->{ key };
    $key = $args->{ id } unless $key;
    my $blog_id = $args->{ blog_id };
    $key = "request_cache : $key";
    $key .= ' : ' . $blog_id if $blog_id;
    my $r = MT::Request->instance;
    my $cache = $r->cache( $key );
    return $cache if $cache;
    my $tokens = $ctx->stash( 'tokens' );
    my $builder = $ctx->stash( 'builder' );
    my $res = $builder->build( $ctx, $tokens, $cond );
    $r->cache( $key, $res );
    return $res;
}

1;