<?php
/**
 * Created by PhpStorm.
 * User: leado
 * Date: 16.07.2017
 * Time: 20:10
 */

namespace Example\Models;


class Item implements \Steam\Models\Item
{
    public function insertOnUpdate(int $appId, string $marketHashName, array $price): bool
    {
        // TODO: Implement insertOnUpdate() method.
        return true;
    }
}