SELECT
    name,
    mz_id AS __id__,

    COALESCE((CASE WHEN building != 'yes' THEN building ELSE NULL END), amenity, shop, tourism) AS kind,

    mz_height AS height,
    mz_min_height AS min_height,

    mz_way14 AS __geometry__

FROM
    planet_osm_polygon

WHERE
    building IS NOT NULL
    AND way_area::bigint > 100

ORDER BY
    way_area DESC,
    __id__ ASC
