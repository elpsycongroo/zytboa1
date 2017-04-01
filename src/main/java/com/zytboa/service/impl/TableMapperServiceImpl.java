package com.zytboa.service.impl;

import com.zytboa.dao.TableMappingMapper;
import com.zytboa.service.TableMapperService;
import com.zytboa.vo.TableMapping;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by Yuudachi on 2017/3/31.
 */
@Service
public class TableMapperServiceImpl implements TableMapperService {

    @Resource
    private TableMappingMapper tableMappingMapper;

    @Override
    public List<TableMapping> findMappingCollection(TableMapping tableMapping) {
        return tableMappingMapper.selectByTableIdAndCol(tableMapping);
    }
}
