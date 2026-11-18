Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794992174;
	b=dlmcQ8rB89Ga0dnxAmBjbTuMvKt/PFK4lsOLEVU5K71lEl4MzouIMCL96lPLWmR+sPG1
	 FD6/iK1+LUxcptFq+OrOcx1AgKbTBlgm7BBLRvtjqWGEq2vOjgBiftx9881Tj5oORiKDn
	 5ksHiV9qfMva/67zYOMOZoA+uYBtNw0hkykyWuz1TN72YsoHFqkyOUqAZw+SGW35JmJPe
	 EGCqgOFWgqfqiTbiTJUerVS2WsASP/zmq6keUtf4W8qA8WkVaHWP5vAh36tLe5ZTR2h4p
	 2kefLLiMUoID8SupXqclymQUGxxG5WlanpigsMIYo4DDzNeGm8SS+5yEKveGZT8RM0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794992174;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Organization:Content-Transfer-Encoding;
	bh=qEXrrBHW/QIPJkf1gZUlYDHhj9XATRYqIOf2wCj343U=;
	b=ViypgflIzsIfyur63Y3GQBDEzzKdCJga3KhlPMVU9JdbH4LGwVjlhM4J9woFlX/5dJb9
	 1Z3aMqfe3j7GFB2tyQgh+0SRKW/zqqzczsgyQUMzZhD2jL8ZhCeJfqIgjv246Rp18sf3H
	 +48mr5eWENJrCXq52woK+FY+FdqI1ElpXbrqLM7CXfPNlX3dd1szxK4OwomX0vIpW78/L
	 PuBiyGXLX6VfDZoDnBTuFQ3fmRvZuByJAxIHoLZZC/nQJ+zgau9onp2GeVn5RKZc1HwQY
	 1hE/evHllF84p8GPeZlXYJ1cfF68dY1415cwjC7y4dqjiyxOyUdfhk0cV0/iF2jmHMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Tq8UpDuu;
	arc=none smtp.remote-ip=198.175.65.21
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E4AC606A334
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 08:56:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7E4AC606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Tq8UpDuu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794992175; x=1826528175;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=7LeIzJ9vzNrL0K71C4xtOg3iAg3ensISpfxr4OpG9OU=;
  b=Tq8UpDuuWRgcFLz00C5NJ/tmhMYnA+8o793EQjp0Y9aRBjQTgqrIRpje
   bsjVn0dCNt3Tu2mfZ9BxZF9ymgZzFRPi4Jgu3S+tu7YDHl+iX3a4e3QW+
   OZ/6iK6bPMRgwZekPHZnwd7UV3fnQZ8piLwxB0kADYkOyxYprZ+Mghmod
   nkPDfk07Yz/8TzO0ojJO9iKtLnHfcNilNUcF2kq8mdCCTNarBzUcXB4Wc
   VUBWb5cbIUISPbHB7Tq0veEcSnsIyKa6oh6VYOJg6sylvrbWLD329MMH+
   o0QyBSC2AlrZCiN9nvALiOxp2eAKosKKUyJwcwa3ssxQi0GloeasPxQG2
   g==;
X-CSE-ConnectionGUID: 5IRZ6k3bTQKOx6LyKTkDpw==
X-CSE-MsgGUID: ZT9NRmSUSXK6G71g9YyIDQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3871974"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3871974"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 00:56:15 -0800
X-CSE-ConnectionGUID: t4OFTQekTnGCsbLmzTS+Iw==
X-CSE-MsgGUID: RoTJL0zeShy5D7KHbrj52A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="10000385"
Received: from weis0040.iil.intel.com ([10.12.217.108])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 00:56:13 -0800
From: Miri Korenblit <miriam.rachel.korenblit@intel.com>
To: miriam.rachel.korenblit@intel.com
Cc: linux-wireless@vger.kernel.org,
	Emmanuel Grumbach <emmanuel.grumbach@intel.com>
Subject: [PATCH v2 iwlwifi-next 13/15] wifi: iwlwifi: mld: PHC: don't read GP2 under the PTP spinlock
Date: Wed, 18 Nov 2026 10:57:45 +0200
Message-Id: <20261118105612.3af90fb76883.Ie50cd66612aed30efab9144c9694119ac150c985@changeid>
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

iwl_mld_ptp_work() reads the GP2 register while holding data->lock.
The lock only protects the software wraparound state, not the register
read. gettime() and adjfine() already read GP2 first and only then take
the lock; a read that races with a newer update is caught by
iwl_mld_ptp_update_new_read() and dropped as an old read.

Read the GP2 outside the lock.

Assisted-by: LLM
Reviewed-by: Emmanuel Grumbach <emmanuel.grumbach@intel.com>
Signed-off-by: Miri Korenblit <miriam.rachel.korenblit@intel.com>
---
 drivers/net/wireless/intel/iwlwifi/mld/ptp.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/intel/iwlwifi/mld/ptp.c b/drivers/net/wireless/intel/iwlwifi/mld/ptp.c
index 9f7d17dbdee1..eafc261c15bb 100644
--- a/drivers/net/wireless/intel/iwlwifi/mld/ptp.c
+++ b/drivers/net/wireless/intel/iwlwifi/mld/ptp.c
@@ -173,11 +173,13 @@ static void iwl_mld_ptp_work(struct work_struct *wk)
 	struct ptp_data *data = &mld->ptp_data;
 	u32 gp2;
 
-	spin_lock_bh(&data->lock);
-	if (!iwl_mld_get_systime(mld, &gp2))
-		iwl_mld_ptp_update_new_read(mld, gp2);
-	else
+	if (iwl_mld_get_systime(mld, &gp2)) {
 		IWL_DEBUG_PTP(mld, "PTP work: failed to read GP2\n");
+		return;
+	}
+
+	spin_lock_bh(&data->lock);
+	iwl_mld_ptp_update_new_read(mld, gp2);
 	spin_unlock_bh(&data->lock);
 }
 
-- 
2.34.1

