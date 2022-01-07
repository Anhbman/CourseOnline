<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\category;
use App\Models\tag;

class CategoryController extends Controller
{
    //
    public function addCategory(Request $request)
    {
        $isSuccess = category::create(array(
            'Category_name' => $request->input('Category_name')
        ));
        if($isSuccess){
            return response()->json(['status'=>true],201); 
        }
        else{
            return response()->json(['status'=>false,'description'=>'Error'],400);
        }
    }

    public function getListCategories(Request $request)
    {   
        $lists = array();
        $listCategories = category::all();
        foreach($listCategories as $category)
        {   
            echo $category->Category_ID;
            $listTags = tag::where('Category_ID','=',$category->Category_ID)->get();
            $list = array('category'=>$category,'tags'=>$listTags);
            array_push($lists,$list);
        }
        // echo $listCategories;
        return response()->json($lists,200);
    }

    public function addTag(Request $request)
    {
        $isSuccess = tag::create(array(
            'Category_ID' => $request->input('Category_ID'),
            'Tag_name' => $request->input('Tag_name')
        ));
        if($isSuccess){
            return response()->json(['status'=>true],201); 
        }
        else{
            return response()->json(['status'=>false,'description'=>'Error'],400);
        }
    }
}
