<?php
/**
 * Created by PhpStorm.
 * User: leado
 * Date: 16.07.2017
 * Time: 18:26
 */

namespace Example\Models;


class Inventory implements \Steam\Models\Inventory
{
    public function updateBySteamId64(int $steamId64, array $inventory): bool
    {
        // TODO: Implement updateBySteamId64() method.
        return true;
    }
}