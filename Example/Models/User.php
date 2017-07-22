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
    public function insertOnUpdate(array $user): bool
    {
        // TODO: Implement insertOnUpdate() method.
        return true;
    }
}