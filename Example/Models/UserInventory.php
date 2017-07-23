<?php
/**
 * Created by PhpStorm.
 * User: leado
 * Date: 16.07.2017
 * Time: 18:26
 */

namespace Example\Models;


class UserInventory implements \Steam\Models\UserInventory
{
    public function insertOrUpdateBySteamId64(int $steamId64, array $inventory): bool
    {
        // TODO: Implement updateBySteamId64() method.
        return true;
    }
}