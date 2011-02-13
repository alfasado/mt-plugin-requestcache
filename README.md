# About RequestCache plugin for Movable Type

## Synopsis

Template code to speed rebuild in single request.

## Template Tags

---------------------------------------

**MTRequestCache(Block Tag)**

In single request, The first time MT renbuild this block,
Next time skip rebuild and return the cache.

*Example:*

    <MTRequestCache key="RecentEntries" blog_id="$blog_id">
        Some template tags that you want to cache.
    </MTRequestCache>

---------------------------------------
