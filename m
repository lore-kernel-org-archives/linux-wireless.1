Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794864119;
	b=KMSr0cuPDu+2UJCgcDtJeaE9eWZLf6KQIPtgW/FFvvlRvctgmh3MhH1ppc/6kTy4nwqo
	 TMnJ/AU/F3lR/DtvzNoYV84/3t255IwlieNe1bDhrRtonw5kC99QUalaaIMOVxD7YC9cH
	 Cnsd9mbx5DCRyVcKfbFP5Jegur0L//Yz7RMELWHBAZv5SZqAV3ChdtcuubGj4xd+Nspjz
	 L3aMF8XmGRFEtjKAhBFudXgEDcxS+KIeI5mZZF6vrI72sDtcC4ixEDFoUOQJLVhXiihFw
	 63sPILuJRnrd8M430No3DUjxs0cXCPpCi4mj5qPFGyrTe7mkmhjF0SMZ9DW8YJK1nLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794864119;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Organization:Content-Transfer-Encoding;
	bh=qEXrrBHW/QIPJkf1gZUlYDHhj9XATRYqIOf2wCj343U=;
	b=zG33DeXaVbc4Artv+qhjJzNtOfjZSrIodQ9BhelWw3mQLHZ0+eqmfOvPX0cmWprM2iBk
	 noshdmlPMwsQg/BbBzrkWVfH2mTAVIYnvMSnP0ti9YAovNlD5eGD0jwqsBUpThpKbVVTe
	 9aCrxfwfGRYfS2zuNyVVbmXt7uwur98q+N2d9mmBWHQnUYp6eUXtZN8JLMDC1dgBrakdk
	 MPWdrYgslqZdLZFA7iUQDXDIs8xtWYjn/i+HqlU541qWAUZ+M0c1I/kds4RbSHLAFt/ZL
	 Yu5KZvf+8fjrftnZ5HQCgwYtHOYzacy0VAkh29w7R+lFUudMOxqf5Ea12BPExFkAohQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=V0rUHYTY;
	arc=none smtp.remote-ip=192.198.163.13
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C40E1606A323
	for <linux-wireless@vger.kernel.org>; Mon, 16 Nov 2026 21:21:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C40E1606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=V0rUHYTY
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794864119; x=1826400119;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=7LeIzJ9vzNrL0K71C4xtOg3iAg3ensISpfxr4OpG9OU=;
  b=V0rUHYTY1azh9LmcWlveHnOQzJNt4jQPlcAYlN0UN/Z3d47trcZoJ5y5
   UrmDqMbTTYSsnJI2P7dDctoAAwd3ryBryd6y8QLuXQLab3mnxZzbL/pXF
   D6w0QolydYy489dUMeFIfkYVib/x6KD+bZgS5P/UTGJltf9VFI59oeAm+
   nzu3btEQATeN84Da0ooqJ4+Ya7jsUY0Adc72weYjiQrjW6gpsg/a1AbL2
   OIlCmU5cg9cnxP4gjbpZCJ9Roz6LYt/Ou+L8/sgk6Mk0N+maobXv6nXd6
   e/cNA2LxSg5mzeHneXoZyN5pgH9BP+RK+R+z1LWep25owC/jImf2g5fjD
   w==;
X-CSE-ConnectionGUID: xnONFeV5SKiCw8vuyAtO1A==
X-CSE-MsgGUID: rktRpE09Q4it5kzJ3GQrOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11968"; a="3604208"
X-IronPort-AV: E=Sophos;i="6.27,217,1787036400"; 
   d="scan'208";a="3604208"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 13:21:58 -0800
X-CSE-ConnectionGUID: 4EaAVRcwS1iNre/bnG/BkQ==
X-CSE-MsgGUID: yhGXcBl+T+GWQwdMG1DXqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,217,1787036400"; 
   d="scan'208";a="9969158"
Received: from weis0040.iil.intel.com ([10.12.217.108])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 13:21:58 -0800
From: Miri Korenblit <miriam.rachel.korenblit@intel.com>
To: miriam.rachel.korenblit@intel.com
Cc: linux-wireless@vger.kernel.org,
	Emmanuel Grumbach <emmanuel.grumbach@intel.com>
Subject: [PATCH iwlwifi-next 13/15] wifi: iwlwifi: mld: PHC: don't read GP2 under the PTP spinlock
Date: Mon, 16 Nov 2026 23:23:31 +0200
Message-Id: <20261116232138.3af90fb76883.Ie50cd66612aed30efab9144c9694119ac150c985@changeid>
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

