<?php
function smarty_block_mtrequestcache ( $args, $content, &$ctx, &$repeat ) {
    $key = $args[ 'key' ];
    if (! $key ) $key = $args[ 'id' ];
    $blog_id = $args[ 'blog_id' ];
    $key = "request_cache : {$key}";
    if ( $blog_id ) {
        $key .= " : {$blog_id}";
    }
    if ( $cache = $ctx->stash( $key ) ) {
        return $cache;
        $repeat = FALSE;
    }
    if ( isset( $content ) ) {
        $ctx->stash( $key, $content );
        return $content;
    }
}
?>