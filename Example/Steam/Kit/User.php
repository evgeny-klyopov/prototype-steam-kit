<?php

namespace Example\Steam\Kit;


class User implements \Steam\Kit\User
{
    public function getSteamId64ByCommunityId(string $communityId): int
    {
        // TODO: Implement getSteam64ByCommunityId() method.
        return '76561197993222972';
    }

    public function getInventoryBySteamId64(int $steamId64): array
    {
        // TODO: Implement getInventoryBySteamId64() method.
        return [];
    }
}
