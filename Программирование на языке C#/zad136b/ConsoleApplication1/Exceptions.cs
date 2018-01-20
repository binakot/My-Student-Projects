using System;

public class Exceptions
{
    public Exceptions() { }

    public int DefSize = 100;

    public bool GetUInt(int cur)
    {        
        if ((cur > 0)&(cur < DefSize)&(cur == (Convert.ToInt16(cur))))
            return true;
        else
            return false;
    }

    public bool GetInt(int cur)
    {
        if (cur == (Convert.ToInt16(cur)))
            return true;
        else
            return false;
    }

    public bool GetDouble(double cur)
    {
        if (cur == Convert.ToDouble(cur)) 
            return true;
        else
            return false;
    }

    public bool GetSelect2(int cur)
    {
        if ((cur == 1)|(cur == 2))
            return true;
        else
            return false;
    }
}