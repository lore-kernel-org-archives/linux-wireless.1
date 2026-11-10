Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794302855;
	b=VqwuJgVDG+2ELltUDy8L87zvRu07Uk5RbFR0xl9DAlRIyBwkWs/I2UaYSaKR/TQLQZH0
	 uJ5jt0SAxqdELI3UD0dz+9pCnYcr3KnlpZzTJxdYPbHQw+99l4nIHIlXPK7sLUTVQ1dfU
	 9S3Y/hzy/ZArl+cbRJjA+xwdVb0Ow6/ohb/zzhwhLaOhnJY0d06OwazSPvO6wgqnVc++Y
	 +7qcFWpCKcC0DUzQGxoqcxGGq8oYVThIP1+Zt3ug0a0xyb0DtaIahb1wTWiW9cBwPclMa
	 vV8+p2mYfoa3wAgK5Ze0PvnDYquSJvnNOyk7SNtRXebkF6/la08s7GdlWydDnAddRYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794302855;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=r03d0V0DO1R17kWu7oT0cLArgA7R8LkZOYGpTn1uF64=;
	b=ngwr+jf5uquXp8IMi+w+o27RnHQjuur8DUHu/KZnksScw1nEN7p11S3WdlIRCc61Lyqd
	 Qcmx4AFgBHH73xRdk+vrCi0AqyXtIppaWp2tYWyokbiYGIfGcSJe2/ALOvCTI4ALfQYkt
	 3Jy0wy1lT0IIao7m3LvXR7+1+ys7OcaP4zmzEHUMnr+5LOlX8MNHkqW12PscRB7yycRie
	 oiqzp713G+rirdduCuAhoz6Ihnour5fQr5ZvqyBqDV91yTTPBV5+qwd760QlK+uWG8zIA
	 MX2ICFhsYkchdkqYsnqk7F1TN0cw4adrw0z90FezUz7tFjQFugxhS0O06ToaRYBYUZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=EjCj1Rfd;
	arc=none smtp.remote-ip=192.198.163.11
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7C44606A33D
	for <linux-wireless@vger.kernel.org>; Tue, 10 Nov 2026 09:27:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A7C44606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=EjCj1Rfd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794302854; x=1825838854;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+pQBzYtlIqsK3OMZ/FLrdsiSf33OGp8rBpCJeMXTzSA=;
  b=EjCj1RfdSKY/thA9foIvqy1KkeEANrPBqZpTV50hdLQmnwHSRRaBs8LO
   3UbofMhRG4mxWUmvG5+I+PoiudOf7LE2ZGI4LhdeE2gWDxGekrfTDxAKw
   t7Y6l9R5o4159B1fRmrSU7mM+YGKDYkwmDFVOkHNAIMi0lEYYSFAHjsF+
   HywDJXrcPjiLlBAELSW6otJdlQjt+10wrhfMzTCHnUX4vGRsrOgfy4C8z
   f9dVUOHExz6G1VcxnVlBsykWf/drVtzA7gD4tux7wTSq9PTQ5Hpe0p68c
   om/QUf29mObKQQ2OAWpLF2jn4qqDUDu/e8jw/PBipTNA4yxc6kzWnPQau
   Q==;
X-CSE-ConnectionGUID: E+c067LoSluwcqJIkYAKPw==
X-CSE-MsgGUID: tUx3uRjFQwKMIgLk0cGrmQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11961"; a="2960837"
X-IronPort-AV: E=Sophos;i="6.27,205,1787036400"; 
   d="scan'208";a="2960837"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2026 01:27:33 -0800
X-CSE-ConnectionGUID: GBkYys5QRW6XYH9zhk09Gw==
X-CSE-MsgGUID: PI3ayCMNQwqsUe1JjUfdTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,205,1787036400"; 
   d="scan'208";a="7977292"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 10 Nov 2026 01:27:30 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xQi8V-00000000wWV-2YhF;
	Tue, 10 Nov 2026 09:27:27 +0000
Date: Tue, 10 Nov 2026 17:27:20 +0800
From: kernel test robot <lkp@intel.com>
To: Devin Wittmayer <lucid_duck@justthetip.ca>,
	Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>
Cc: oe-kbuild-all@lists.linux.dev, Deren Wu <deren.wu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Quan Zhou <quan.zhou@mediatek.com>,
	Michael Lo <michael.lo@mediatek.com>,
	James-LY Huang <james-ly.huang@mediatek.com>,
	linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2] wifi: mt76: mt792x: tell mac80211 when a disconnect
 cancels its ROC
Message-ID: <202611101719.St87Ty1E-lkp@intel.com>
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
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20261110/202611101719.St87Ty1E-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261110/202611101719.St87Ty1E-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611101719.St87Ty1E-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/net/wireless/mediatek/mt76/mt7921/main.c: In function 'mt7921_roc_abort_sync':
>> drivers/net/wireless/mediatek/mt76/mt7921/main.c:385:16: error: 'struct mt792x_phy' has no member named 'roc_notify'
     385 |         if (phy->roc_notify)
         |                ^~
   drivers/net/wireless/mediatek/mt76/mt7921/main.c: In function 'mt7921_abort_roc':
   drivers/net/wireless/mediatek/mt76/mt7921/main.c:423:27: error: 'struct mt792x_phy' has no member named 'roc_notify'
     423 |         if (aborted && phy->roc_notify)
         |                           ^~
   drivers/net/wireless/mediatek/mt76/mt7921/main.c: In function 'mt7921_set_roc':
   drivers/net/wireless/mediatek/mt76/mt7921/main.c:441:12: error: 'struct mt792x_phy' has no member named 'roc_notify'
     441 |         phy->roc_notify = type == MT7921_ROC_REQ_ROC;
         |            ^~
   drivers/net/wireless/mediatek/mt76/mt7921/main.c: In function 'mt7921_cancel_remain_on_channel':
   drivers/net/wireless/mediatek/mt76/mt7921/main.c:484:12: error: 'struct mt792x_phy' has no member named 'roc_notify'
     484 |         phy->roc_notify = false;
         |            ^~
--
   drivers/net/wireless/mediatek/mt76/mt7925/main.c: In function 'mt7925_roc_abort_sync':
>> drivers/net/wireless/mediatek/mt76/mt7925/main.c:531:16: error: 'struct mt792x_phy' has no member named 'roc_notify'
     531 |         if (phy->roc_notify)
         |                ^~
   drivers/net/wireless/mediatek/mt76/mt7925/main.c: In function 'mt7925_abort_roc':
   drivers/net/wireless/mediatek/mt76/mt7925/main.c:569:27: error: 'struct mt792x_phy' has no member named 'roc_notify'
     569 |         if (aborted && phy->roc_notify)
         |                           ^~
   drivers/net/wireless/mediatek/mt76/mt7925/main.c: In function 'mt7925_cancel_remain_on_channel':
   drivers/net/wireless/mediatek/mt76/mt7925/main.c:657:12: error: 'struct mt792x_phy' has no member named 'roc_notify'
     657 |         phy->roc_notify = false;
         |            ^~


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
