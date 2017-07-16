<?php
/**
 * Created by PhpStorm.
 * User: leado
 * Date: 16.07.2017
 * Time: 21:37
 */

namespace Example\Models;


class UserBadge implements \Steam\Models\UserBadge
{
    public function updateBySteamId64(int $steamId64, array $badges): bool
    {
        // TODO: Implement updateBySteamId64() method.
        return true;
    }
}