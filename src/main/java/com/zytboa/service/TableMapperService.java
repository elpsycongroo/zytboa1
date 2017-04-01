package com.zytboa.service;

import com.zytboa.vo.TableMapping;

import java.util.List;

/**
 * Created by Administrator on 2017/3/31.
 */
public interface TableMapperService {
    List<TableMapping> findMappingCollection(TableMapping tableMapping);
}
