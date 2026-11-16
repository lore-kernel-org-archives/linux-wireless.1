Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794864120;
	b=itb1VRr6SwK+4Ji5KnrdOeOQkAOgKQnQDM3ohmJ6l6c2ln1eTe79Wr9BXzzl7DnmP3F+
	 FaFYAUqG4nyNfN3CcZXbHHYWZX3qV3drcGI+FwKsmL51SN4fSrJ8+2vGcCxHhwGKmp2xQ
	 +Uk/3aXceOrRxlfG6bdc7QcDEDSe+9R+dx5alP8fV+fJHWxxvOIBZYDlMRRuDNvisCerU
	 QHR1/pZ0vSg+w4IULPj+SJq2VTmnEdF5Ri7wOWQ1huPJIkNWJOWCyDAI+JM+9S6XfTUzr
	 IXx1gbb8KuoM6jxKoiRbD1s2bQnVr6dzmDIP6nhqU/hhlI20USHcENKQHRa9pTvx5Fw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794864120;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Organization:Content-Transfer-Encoding;
	bh=r45t286e5iGJ8dYBzR3dt5j05JjFFpi23Zi7g2mTS9w=;
	b=BevHI/kcNIeaMdx5km/GY4AHq3GvR2VTaMVnXJWIy63sVOebNdCGjsFBBingOKBx6j5T
	 qEbnCTvosAqzwCcEzGD/HuahNSwH34DP9FE+7JoVP3iJO2i9wAadP+m13RSIi0ylUQVMM
	 LAyqo1vD5HziFH82s7H7fGo1l5hc36towv3BwPOOvMp9XeaXtyHuFdk/RsD/d4QJDUac4
	 5Xej5CtTOsgQwqvffbH87LJYQgVZF2Khp3wHZs9Qkl6fYGjFQb0d4C2II6bt85MFzimUR
	 a4ka3ByFaQ31nXhjSBhwR1Wqr7p8u+SzxgH9ESz0zVR4/fmk+E+eEpD2iWyzztw35dA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BPmQJg4R;
	arc=none smtp.remote-ip=192.198.163.13
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C638606A322
	for <linux-wireless@vger.kernel.org>; Mon, 16 Nov 2026 21:22:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C638606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BPmQJg4R
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794864120; x=1826400120;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=0lN1Xi5AliIAt0oBQUD+DOsSgRM8jvgwwZVwOUU/9mw=;
  b=BPmQJg4RWLjM4d0zRlmvsT63rkcvyqsSIpW1WX0gdAoAUIF8tC8+lLiX
   j5t2FeZ4U3/gAT5Mif0U5pRRJm2mqybXOqcNh0UICi0CDFUUutRvy5nwE
   YMbwUdKUDmS88nLqfK3HNGwDIcyQxKzG1DqGSiti9/5BNPrh6YgJ9xcFu
   yALROLyqYLCfKyq3dSGYSw8MTh79DtJC1reovyWyNrY3aljnHbJ4E0hXM
   6TTvKs2km+n4ThxWNoAg6dN/KE6YKltA851tPqYgM7jKuKOjNfzU2bEKJ
   dBX7QF1Ro8ok+Ym/SKaI6QJOXFDU4VsFIFZ/XB5ChN35ow3iwg1nYt3c/
   Q==;
X-CSE-ConnectionGUID: /TKrwuHbRtOZFtpneOeX4Q==
X-CSE-MsgGUID: CBlGZ9kzQUy8x/FI+xo2EA==
X-IronPort-AV: E=McAfee;i="6800,10657,11968"; a="3604209"
X-IronPort-AV: E=Sophos;i="6.27,217,1787036400"; 
   d="scan'208";a="3604209"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 13:22:00 -0800
X-CSE-ConnectionGUID: 1ct2BZ2USPiyuGij1Gjq7g==
X-CSE-MsgGUID: NrJ2m62rR2SU8D5x6NUaJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,217,1787036400"; 
   d="scan'208";a="9969162"
Received: from weis0040.iil.intel.com ([10.12.217.108])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 13:21:59 -0800
From: Miri Korenblit <miriam.rachel.korenblit@intel.com>
To: miriam.rachel.korenblit@intel.com
Cc: linux-wireless@vger.kernel.org,
	Johannes Berg <johannes.berg@intel.com>,
	Emmanuel Grumbach <emmanuel.grumbach@intel.com>
Subject: [PATCH iwlwifi-next 14/15] wifi: iwlwifi: mld: take the PTP lock for the monitor timestamp
Date: Mon, 16 Nov 2026 23:23:32 +0200
Message-Id: <20261116232138.c58819a70dc4.I74b545a13bf928036d6884855353e20031adf632@changeid>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261116212333.2404653-1-miriam.rachel.korenblit@intel.com>
References: <20261116212333.2404653-1-miriam.rachel.korenblit@intel.com>
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Organization: Intel Israel (74) Limited
Content-Transfer-Encoding: 8bit

iwl_mld_ptp_get_adj_time() must be called with the PTP lock held: it
updates the GP2 wraparound tracking and reads the scale data that the
PTP adjfine/adjtime callbacks modify. The monitor RX path calls it
without the lock, which races with those callbacks and triggers the
lockdep assertion.

Take the lock around the call, as the other callers do.

Assisted-by: LLM
Reviewed-by: Johannes Berg <johannes.berg@intel.com>
Reviewed-by: Emmanuel Grumbach <emmanuel.grumbach@intel.com>
Signed-off-by: Miri Korenblit <miriam.rachel.korenblit@intel.com>
---
 drivers/net/wireless/intel/iwlwifi/mld/rx.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/intel/iwlwifi/mld/rx.c b/drivers/net/wireless/intel/iwlwifi/mld/rx.c
index e1964e570012..0401b19f8b09 100644
--- a/drivers/net/wireless/intel/iwlwifi/mld/rx.c
+++ b/drivers/net/wireless/intel/iwlwifi/mld/rx.c
@@ -2131,10 +2131,13 @@ static void iwl_mld_rx_fill_status(struct iwl_mld *mld, int link_id,
 		iwl_mld_add_rtap_sniffer_config(mld, skb);
 
 		if (mld->monitor.ptp_time) {
-			u64 adj_time =
-				iwl_mld_ptp_get_adj_time(mld,
-							 phy_data->gp2_on_air_rise *
-							 NSEC_PER_USEC);
+			u64 adj_time;
+
+			spin_lock_bh(&mld->ptp_data.lock);
+			adj_time = iwl_mld_ptp_get_adj_time(mld,
+							    phy_data->gp2_on_air_rise *
+							    NSEC_PER_USEC);
+			spin_unlock_bh(&mld->ptp_data.lock);
 
 			rx_status->mactime = div64_u64(adj_time, NSEC_PER_USEC);
 			rx_status->flag |= RX_FLAG_MACTIME_IS_RTAP_TS64;
-- 
2.34.1

