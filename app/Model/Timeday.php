<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

/**
 * Class Timeday.
 *
 * @author  The scaffold-interface created at 2017-06-26 11:25:28am
 * @link  https://github.com/amranidev/scaffold-interface
 */
class Timeday extends Model
{
	
	
    protected $table = 'timedays';

	

	/**
     * user_has_role.
     *
     * @return  \Illuminate\Support\Collection;
     */
    public function user_has_roles()
    {
        return $this->belongsToMany('App\User_has_role');
    }

    /**
     * Assign a user_has_role.
     *
     * @param  $user_has_role
     * @return  mixed
     */
    public function assignUser_has_role($user_has_role)
    {
        return $this->user_has_roles()->attach($user_has_role);
    }
    /**
     * Remove a user_has_role.
     *
     * @param  $user_has_role
     * @return  mixed
     */
    public function removeUser_has_role($user_has_role)
    {
        return $this->user_has_roles()->detach($user_has_role);
    }

}
