Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794311716;
	b=ee4OTKPoZfrQNWxgloGw5lLAkOSn8HHJ6PqkwxLkPRPFPtwPOGYfOB4bR7I93O+JpeAm
	 M33JRd0Zs9sJ+nudsuYF52qDiqREYkrsjrCQGAcN35I2hjCJo7zKMth1EpVkONXLBvdXw
	 dn6gfTCSnit+tp2nQsLcXTH0Vr+KE25ae9sUiBfL2tVu0R985HxwuemENexg5PqhS7SWX
	 vp9qTPKcGlnLm3dzVWJpPrvmh4HK5+M4PF6m2hdGCE+nqLLgTFdJyTm2H54Guw1DACnsy
	 yFWUi4Wdu5x8flphFG0zost9+obw+wisUwV1QjKuIH1wxXwBLhJTzw+36OV5SFIx2lQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794311716;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=Kt1SdcCjffIWXMIQm5IGLvK7jU+eDRRMBhPemFkwyIk=;
	b=3geC4xqYHrth1zwE2x3aTCR2eSwbuvtllZxGInr+yxt5VRes/Vqf0T16YdWOsi3naPWA
	 +RGQAyKCbqzRSlJ/vapn6DHKie7SMbhm0UhFxdQuuT1MrAh74LJovTf/E1MN0sr5wkkMn
	 GAa3imzOjZ64w+OKtdP9TOy2rqKmOTWTVWH7k9YHg2qik3kjhsByYENWIAnUve1Btu0W2
	 X4jI2YciEM59EFfKkqY3xyV6nPb5p/pyIldXY+C169vemHwODTu6Bf0q1e9NuLhnkFHFW
	 9wzlOeJ7010jOeLN96A1/vEM0Zoe5pntCFB3K1YT02elDMcTzsaaY+4DXGig32hn01g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NVOLCicd;
	arc=none smtp.remote-ip=192.198.163.18
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2029606A32A
	for <linux-wireless@vger.kernel.org>; Tue, 10 Nov 2026 11:55:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D2029606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NVOLCicd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794311715; x=1825847715;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xLC+Kp82pZhBULyTbznvfCirX6FuTOGlXW/eTvQqYlc=;
  b=NVOLCicdqV6APy+6/b/pZh2EUP0OHivabPa8V9d8cO/ZQbIrfcYwVw1+
   HHCCzsByxyZ8FODOnOrPemE3/yQ7Q94nIBHGUlzRBfkqf+sqoRyFaA5uN
   b8jpDkNMsg7zje252shMTcX0lUsP9dwjxDNVKIldAv76H0Ryw/rA/NEj0
   LJszUHFDSP8wIoHsUH+Gc0H8FeLoiuIsKfqNiPfiOl+s7phpIM45AoTVc
   1P/3QFRA/n9osurZConJrp68oHG4L270xUJnzLRPBKWlBMepuYuBa0OOX
   mLfSwTLPc1S0dxczrenYlzVHygvaWL7FDvscWCEkwa+57SSWrllSQGmFX
   Q==;
X-CSE-ConnectionGUID: lSBjry1pTuWknH1VRAvptA==
X-CSE-MsgGUID: v4S/4m7tTiGaCe5OJSPnPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11961"; a="3089586"
X-IronPort-AV: E=Sophos;i="6.27,205,1787036400"; 
   d="scan'208";a="3089586"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2026 03:54:58 -0800
X-CSE-ConnectionGUID: 5YMhyP92TbKKx+LivObr5w==
X-CSE-MsgGUID: soXjYcdHSc6iOzg9sreG/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,205,1787036400"; 
   d="scan'208";a="10000802"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa013.fm.intel.com with ESMTP; 10 Nov 2026 03:54:54 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xQkR9-00000000wlT-0yc6;
	Tue, 10 Nov 2026 11:54:51 +0000
Date: Tue, 10 Nov 2026 19:54:37 +0800
From: kernel test robot <lkp@intel.com>
To: Devin Wittmayer <lucid_duck@justthetip.ca>,
	Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Deren Wu <deren.wu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Quan Zhou <quan.zhou@mediatek.com>,
	Michael Lo <michael.lo@mediatek.com>,
	James-LY Huang <james-ly.huang@mediatek.com>,
	linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2] wifi: mt76: mt792x: tell mac80211 when a disconnect
 cancels its ROC
Message-ID: <202611101937.hzmTxgbR-lkp@intel.com>
References: <20261110005846.38432-1-lucid_duck@justthetip.ca>
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261110005846.38432-1-lucid_duck@justthetip.ca>

Hi Devin,

kernel test robot noticed the following build errors:

[auto build test ERROR on wireless-next/main]
[also build test ERROR on wireless/main linus/master v7.4-rc2 next-20261109]
[cannot apply to linux-review/Devin-Wittmayer/wifi-mt76-mt792x-tell-mac80211-when-a-disconnect-cancels-its-ROC/20261022-184827]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Devin-Wittmayer/wifi-mt76-mt792x-tell-mac80211-when-a-disconnect-cancels-its-ROC/20261109-175846
base:   https://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless-next.git main
patch link:    https://lore.kernel.org/r/20261110005846.38432-1-lucid_duck%40justthetip.ca
patch subject: [PATCH v2] wifi: mt76: mt792x: tell mac80211 when a disconnect cancels its ROC
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20261110/202611101937.hzmTxgbR-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project b3e2466a7ef2bbc97d31230c3bf39a6fa50a608a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261110/202611101937.hzmTxgbR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611101937.hzmTxgbR-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/net/wireless/mediatek/mt76/mt7921/main.c:385:11: error: no member named 'roc_notify' in 'struct mt792x_phy'
     385 |         if (phy->roc_notify)
         |             ~~~  ^
   drivers/net/wireless/mediatek/mt76/mt7921/main.c:423:22: error: no member named 'roc_notify' in 'struct mt792x_phy'
     423 |         if (aborted && phy->roc_notify)
         |                        ~~~  ^
   drivers/net/wireless/mediatek/mt76/mt7921/main.c:441:7: error: no member named 'roc_notify' in 'struct mt792x_phy'
     441 |         phy->roc_notify = type == MT7921_ROC_REQ_ROC;
         |         ~~~  ^
   drivers/net/wireless/mediatek/mt76/mt7921/main.c:484:7: error: no member named 'roc_notify' in 'struct mt792x_phy'
     484 |         phy->roc_notify = false;
         |         ~~~  ^
   4 errors generated.
--
>> drivers/net/wireless/mediatek/mt76/mt7925/main.c:531:11: error: no member named 'roc_notify' in 'struct mt792x_phy'
     531 |         if (phy->roc_notify)
         |             ~~~  ^
   drivers/net/wireless/mediatek/mt76/mt7925/main.c:569:22: error: no member named 'roc_notify' in 'struct mt792x_phy'
     569 |         if (aborted && phy->roc_notify)
         |                        ~~~  ^
   drivers/net/wireless/mediatek/mt76/mt7925/main.c:657:7: error: no member named 'roc_notify' in 'struct mt792x_phy'
     657 |         phy->roc_notify = false;
         |         ~~~  ^
   3 errors generated.


vim +385 drivers/net/wireless/mediatek/mt76/mt7921/main.c

   370	
   371	void mt7921_roc_abort_sync(struct mt792x_dev *dev)
   372	{
   373		struct mt792x_phy *phy = &dev->phy;
   374	
   375		if (!test_and_clear_bit(MT76_STATE_ROC, &phy->mt76->state))
   376			return;
   377	
   378		timer_delete_sync(&phy->roc_timer);
   379		cancel_work(&phy->roc_work);
   380	
   381		ieee80211_iterate_interfaces(mt76_hw(dev),
   382					     IEEE80211_IFACE_ITER_RESUME_ALL,
   383					     mt7921_roc_iter, (void *)phy);
   384	
 > 385		if (phy->roc_notify)
   386			ieee80211_remain_on_channel_expired(mt76_hw(dev));
   387	}
   388	EXPORT_SYMBOL_GPL(mt7921_roc_abort_sync);
   389	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
