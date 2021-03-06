<?php

namespace Example\Steam\Kit;


class User implements \Steam\Kit\User
{
    public function getCommunityData(string $communityId): array
    {
        // TODO: Implement getSteam64ByCommunityId() method.
        return [
            'steamId64'     => 76561197993222972,
            'communityId'   => 'dronoz'
        ];
    }

    public function getInventoryBySteamId64(int $steamId64): array
    {
        // TODO: Implement getInventoryBySteamId64() method.
        return [
            1 => 20,
            2 => 30
            // ...
        ];
    }

    public function getBadges(int $steamId64): array
    {
        // TODO: Implement getBadges() method.
        return [
            18300  => 5,
            639900 => 12
            // ...
        ];
    }

    public function getLevelBadge(int $steamId64, int $gameCardId): int
    {
        // TODO: Implement getLevelBadge() method.
        return 1;
    }
}