<?php
/**
 * Created by PhpStorm.
 * User: leado
 * Date: 16.07.2017
 * Time: 17:53
 */

namespace Example\Models;


class User implements \Steam\Models\User
{
    public function insertOnUpdateUserBySteamId64(int $steamId64, string $steamCommunityId): bool
    {
        // TODO: Implement insertOnUpdateUserBySteamId64() method.
        return true;
    }
}