package cn.wj.service.serviceImpl;

import cn.wj.dao.GoodsInfoDao;
import cn.wj.domain.GoodsInfo;
import cn.wj.exception.OtherThingsException;
import cn.wj.service.GoodsInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 说明： 售货机实时数据
 * 作者： 王娇
 * 时间： 2017 年 08月 07 日
 */
@Service("goodInfoService")
public class GoodsInfoServiceImpl implements GoodsInfoService {
	@Autowired
	private GoodsInfoDao goodsInfoDao;//加入事物的管理

	/**
	 * 功能说明： 1.1.1  运营商管理员 更新商品信息表
	 * @param goodsInfo
	 * @throws Exception
	 */
	public void updateGoodsInfo(GoodsInfo goodsInfo) throws OtherThingsException {
		int result1 = 0;//受影响的行数默认为零
		try {
			result1 = goodsInfoDao.updateGoodsInfo(goodsInfo);
		} catch (Exception e) {
			System.out.println(" 运营商更新商品信息表 service失败");
			//其他用户添加失败异常
			throw new OtherThingsException(e);
		}
		if (result1 > 0) {
			System.out.println(" 运营商更新商品信息表 service更新用户信息成功！");
		}
	}
	//==================自动生成===========================
	@Override
	public void add(GoodsInfo goodsInfo) throws Exception {

	}

	@Override
	public void update(GoodsInfo goodsInfo) throws Exception {

	}

	@Override
	public List<GoodsInfo> findAll(int pageNum, int pageSize) {
		return null;
	}


}
