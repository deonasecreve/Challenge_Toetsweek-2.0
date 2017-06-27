<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

/**
 * Class Timedays.
 *
 * @author  The scaffold-interface created at 2017-06-26 11:25:29am
 * @link  https://github.com/amranidev/scaffold-interface
 */
class Timedays extends Migration
{
    /**
     * Run the migrations.
     *
     * @return  void
     */
    public function up()
    {
        Schema::create('timedays',function (Blueprint $table){

        $table->increments('id');
        
        $table->date('date_appointment');
        
        /**
         * Foreignkeys section
         */
        
        
        $table->timestamps();
        
        
        // type your addition here

        });
    }

    /**
     * Reverse the migrations.
     *
     * @return  void
     */
    public function down()
    {
        Schema::drop('timedays');
    }
}
