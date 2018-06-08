pragma solidity 0.4.23;

contract IterableMapping {

    // Replace TKey and TValue with approporiate types.
    mapping(TKey => TValue) public values;
    mapping(TKey => index) keysIndexes;
    TKey[] keys;

    function contains(TKey key) returns (bool)
    {
        return keysIndexes[key] == keys[keysIndexes[key]];
    }

    function add(TKey key, TValue value) public
    {
        values[key] = value;
        keysIndexes[key] = keys.length;
        keys.push(key);
    }

    function delete(TKey key) public
    {
        uint index = keysIndexes[key];
        delete values[key];
        delete keysIndexes[key];
        keys[index] = keys[keys.length - 1];
        keys.length--;
        keysIndexes[keys[index]] = index;
    }

    function count() public 
    {
        return keys.length;
    }


    function getRangeKeys(uint start, uint count) returns(TKey[])
    {
        TKey[] result = TKeys[](count);
        for(uint i = start; i < start + count; i++)
            result[i - start] = keys[i];
        return result;
    }

    //If it's possible to return values
    function getRangeValues(uint start, uint count) returns(TValue[])
    {
        TValue[] result = TValue[](count);
        for(uint i = start; i < start + count; i++)
            result[i - start] = values[keys[i]];
        return result;
    }

}