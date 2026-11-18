Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794992176;
	b=RRUB+3qkBngZdN0QwUnGHwxcP40O+/8jrN7jQvs/tOj7zp0bHWBMymXOiHATi+Z40QnI
	 48EnrnNj3lPUBIYDrDGx+yAWKIYMaoMGw4AZPjmQr63SqmJ2RvAqj9hPD3MPwOwONKshz
	 0Hv+NyLtiaBTMNzTUHayAqVN9touJ0O/uo1yQA2dXIh+7P2QaDUUR1U+o7y3w7trz+QW1
	 cka8oL8p/koEM+1JrE7o3RhZ4XOo8xoYG+EA2ZSDYBaGWLhWXFxQhGgC/xCmP4KLu4GIq
	 RsQn/UQCnLmfk3JPBFBFzzKuUFcjJ8HFBBQyPDxxX6pVc6WnvuEGfpFOc9OFrRA8fhQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794992176;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Organization:Content-Transfer-Encoding;
	bh=r45t286e5iGJ8dYBzR3dt5j05JjFFpi23Zi7g2mTS9w=;
	b=IS34GNILDmk5B52XT5YdaV6tl+1FU2V+kZExbvEObBCXLgO2wPp7egc4lc2qiQO4KXn7
	 5nsnlDHTieB39OHtXinlgRLc0UiPPvBjkMWMtct2dnmGg0qkJ6Skg4fA+b/ll1duvkG9r
	 ZUxo+Oxxfzy7YhNi5vD3QO/NX3GkOq2PaKvj/hMN81evkzrJHESn6fRKTWNlKff1xtrNf
	 52zm4oIauvhPB4lO1yqG+KPPNWkDpTwIb198bNZxpgBWU5PT6DUuflu4sB7knRhLIZ+ni
	 ul/BFjPVWYQHanRr50ZvJeg0ycD3AuDsm/p0b565dDBLo0PmqvcUnySvKKlECti3UTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hQXP9pn6;
	arc=none smtp.remote-ip=198.175.65.21
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49ED1606A31C
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 08:56:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 49ED1606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hQXP9pn6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794992177; x=1826528177;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=0lN1Xi5AliIAt0oBQUD+DOsSgRM8jvgwwZVwOUU/9mw=;
  b=hQXP9pn6oV+uo5HuEmM+uDJ/P8GT3R32TuxlrpnozoFtnPpMTn4aqPVZ
   2iEi2LQJL2aHKOyylQ4thhXGvgk2mrUi9vr8VYRmb3jZuQrJ6AP4/xpLQ
   C8laiw7MIH1e7bej66Q7Le6pfu2ILTJKq2UswU4J+BN4R2riSPL04sI0T
   QvnTNOe4N/3V4Vh3t+vZQSShUym8aaCtitC+6BNcIpxN+f3823cYP2JSx
   o4fUKVXFZHL51kfpQKHKxvqlpJHoiy3iph8HOXVhf9Cpyo1efGgDPbscR
   EQigo6kDIwDfxAIownWI7aOmfu6vthTyXTbVZkA39fwxs3PI3nNJwLqlS
   A==;
X-CSE-ConnectionGUID: 1uneTSZUR0W0BPXmy37oAw==
X-CSE-MsgGUID: WlUzoe0FRn+vF7Ew/LnlPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3871975"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3871975"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 00:56:17 -0800
X-CSE-ConnectionGUID: UiShkh34SfKbv75WmXyhOg==
X-CSE-MsgGUID: MhXN5kp/RbC86P4Q8K05Nw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="10000408"
Received: from weis0040.iil.intel.com ([10.12.217.108])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 00:56:14 -0800
From: Miri Korenblit <miriam.rachel.korenblit@intel.com>
To: miriam.rachel.korenblit@intel.com
Cc: linux-wireless@vger.kernel.org,
	Johannes Berg <johannes.berg@intel.com>,
	Emmanuel Grumbach <emmanuel.grumbach@intel.com>
Subject: [PATCH v2 iwlwifi-next 14/15] wifi: iwlwifi: mld: take the PTP lock for the monitor timestamp
Date: Wed, 18 Nov 2026 10:57:46 +0200
Message-Id: <20261118105612.c58819a70dc4.I74b545a13bf928036d6884855353e20031adf632@changeid>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261118085747.3845425-1-miriam.rachel.korenblit@intel.com>
References: <20261118085747.3845425-1-miriam.rachel.korenblit@intel.com>
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

