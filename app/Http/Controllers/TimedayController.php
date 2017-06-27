<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\App;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Timeday;
use Amranidev\Ajaxis\Ajaxis;
use URL;

/**
 * Class TimedayController.
 *
 * @author  The scaffold-interface created at 2017-06-26 11:25:29am
 * @link  https://github.com/amranidev/scaffold-interface
 */
class TimedayController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return  \Illuminate\Http\Response
     */
    public function index()
    {
        $title = 'Index - timeday';
        $timedays = Timeday::paginate(6);
        return view('timeday.index',compact('timedays','title'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return  \Illuminate\Http\Response
     */
    public function create()
    {
        $title = 'Create - timeday';
        
        return view('timeday.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param    \Illuminate\Http\Request  $request
     * @return  \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $timeday = new Timeday();

        
        $timeday->date_appointment = $request->date_appointment;

        
        
        $timeday->save();

        $pusher = App::make('pusher');

        //default pusher notification.
        //by default channel=test-channel,event=test-event
        //Here is a pusher notification example when you create a new resource in storage.
        //you can modify anything you want or use it wherever.
        $pusher->trigger('test-channel',
                         'test-event',
                        ['message' => 'A new timeday has been created !!']);

        return redirect('timeday');
    }

    /**
     * Display the specified resource.
     *
     * @param    \Illuminate\Http\Request  $request
     * @param    int  $id
     * @return  \Illuminate\Http\Response
     */
    public function show($id,Request $request)
    {
        $title = 'Show - timeday';

        if($request->ajax())
        {
            return URL::to('timeday/'.$id);
        }

        $timeday = Timeday::findOrfail($id);
        return view('timeday.show',compact('title','timeday'));
    }

    /**
     * Show the form for editing the specified resource.
     * @param    \Illuminate\Http\Request  $request
     * @param    int  $id
     * @return  \Illuminate\Http\Response
     */
    public function edit($id,Request $request)
    {
        $title = 'Edit - timeday';
        if($request->ajax())
        {
            return URL::to('timeday/'. $id . '/edit');
        }

        
        $timeday = Timeday::findOrfail($id);
        return view('timeday.edit',compact('title','timeday'  ));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param    \Illuminate\Http\Request  $request
     * @param    int  $id
     * @return  \Illuminate\Http\Response
     */
    public function update($id,Request $request)
    {
        $timeday = Timeday::findOrfail($id);
    	
        $timeday->date_appointment = $request->date_appointment;
        
        
        $timeday->save();

        return redirect('timeday');
    }

    /**
     * Delete confirmation message by Ajaxis.
     *
     * @link      https://github.com/amranidev/ajaxis
     * @param    \Illuminate\Http\Request  $request
     * @return  String
     */
    public function DeleteMsg($id,Request $request)
    {
        $msg = Ajaxis::BtDeleting('Warning!!','Would you like to remove This?','/timeday/'. $id . '/delete');

        if($request->ajax())
        {
            return $msg;
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param    int $id
     * @return  \Illuminate\Http\Response
     */
    public function destroy($id)
    {
     	$timeday = Timeday::findOrfail($id);
     	$timeday->delete();
        return URL::to('timeday');
    }
}
