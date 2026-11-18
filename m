Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794992170;
	b=LCdmJM1ZIzbLTSe513/8Il4JLfMWpfZu5oQTHkHXCu8hPaDJs5jh8c6aXC5aKJNVMKGg
	 I0COokWquQrGdva+o1Om2mvvz8IQ17Sloa43ijTosW3CEQkCangbFN96LaWAzlLPx5Qi6
	 nV8gwZed2lJPBcRKZQPulm6j1svIXxEbgQLaQfZwHJtVy21USYjMitXGjbnQzm27M5fkM
	 5XF/YuPYUIqkpGdxusMW6tpVXRT9zqh7E99IAhaFlOMk3CZf88hM98WyBWPWgpuFZZmJs
	 fXQHMg4OGq1KHv82WYrQuzgR204rZBwBEjDQbI0s0JWlCUKgk3NTngkZ2IHgsFjPX6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794992170;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Organization:Content-Transfer-Encoding;
	bh=aXJIdeKgB/y/v9VsoxHbKoAEiZIb/HV/Q7gi7iFtvC0=;
	b=pxgoB51E3IZMp/60u91AJrFLAu3y0RPb55jSXRCzATslDc8ge81kE50nGCqf7y1cAzJp
	 YP0n+HLNiy7KTdXLN/MY0V0AWkek4sL29kfQKpB9l1OrTuCHZx4d8M7I5C2L6l364XFUQ
	 T7vDAnc1UwfSFyS8JLzB5fiSjqrChnMc3D7kSUdzKuM2r0DtCIGsmgvxLxOpNFbMPhUr1
	 PjVAKQEpjiyboHZgVsXR1dzOuQ+BOSwqG/nUdWYnU47XFOB4OXW4C1EI0UBuoWnmPTsW2
	 b/9hzTnvWVrQerhZup1ZKb6MeHw/VRPMBuWRyIaispVZHiOe2c0ARdhd8RyrUnFLFGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VcoPR9R0;
	arc=none smtp.remote-ip=198.175.65.21
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95C49606A331
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 08:56:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 95C49606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VcoPR9R0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794992170; x=1826528170;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=XqD+ytfIXJHqmadqcNZci9CuvLDotT9xl1Zi5/ZYOHI=;
  b=VcoPR9R0PBTKWnRu81bbxEzbIBVm970LY2kpP3mRtwd9EM854r8QCuWP
   QnDVQt33PazwUtjg/fRF5X7WDsRNW8vGU9h54M4kjt7d4Px8277zGb+wG
   XYWSiKgFScNz+3QdUJp+IwVRsGu8ZV4oUfrR/d3GQlctYjOSI4VZzftGW
   kQ/z3bjdNT1s1xMM85MGSsSFC/2ybBnetaZZGcSXAShctZmcW5WsFhvTb
   vvcoBCrX378q3T7eVSgMEhd3IVUYCUUyQij8oMSx6woSuur58G+YZc3s4
   TTkNQF617p4f8XlIKdty5OGO5rRTb2cc7uckUKFgL1YwhVxU0MgxxYcID
   w==;
X-CSE-ConnectionGUID: qooqvJ7TRWaYwP/yvGP96Q==
X-CSE-MsgGUID: x3/kvv0lQKuBiZMv21UbhQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3871962"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3871962"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 00:56:10 -0800
X-CSE-ConnectionGUID: JrOED5usQDWXlxbIfsL7Xw==
X-CSE-MsgGUID: K2CpivhlTZ6cHqQnIcsT0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="10000316"
Received: from weis0040.iil.intel.com ([10.12.217.108])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 00:56:08 -0800
From: Miri Korenblit <miriam.rachel.korenblit@intel.com>
To: miriam.rachel.korenblit@intel.com
Cc: linux-wireless@vger.kernel.org,
	Johannes Berg <johannes.berg@intel.com>
Subject: [PATCH v2 iwlwifi-next 10/15] wifi: iwlwifi: mld: dump the FW error logs from dump_error
Date: Wed, 18 Nov 2026 10:57:42 +0200
Message-Id: <20261118105612.3a171bd66b0a.Ie743c51b74024019c00d176fa650a439830b1301@changeid>
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

The nic_error op must be atomic, but dumping the FW error logs reads the
error tables from the device, which may sleep on some transports.

Dump them from dump_error instead, which can sleep.
Reading the tables later is fine: the FW is halted after the error,
and dump_error always runs before the device is reset or stopped,
so the tables are still intact.

This also fixes a race: do_not_dump_once shares a bitfield with other
fw_status flags that are modified under the wiphy lock, but nic_error
cleared it without holding that lock. dump_error holds it.

Assisted-by: LLM
Reviewed-by: Johannes Berg <johannes.berg@intel.com>
Signed-off-by: Miri Korenblit <miriam.rachel.korenblit@intel.com>
---
 drivers/net/wireless/intel/iwlwifi/mld/mld.c | 21 ++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/intel/iwlwifi/mld/mld.c b/drivers/net/wireless/intel/iwlwifi/mld/mld.c
index 71832d92024d..57ff811964bd 100644
--- a/drivers/net/wireless/intel/iwlwifi/mld/mld.c
+++ b/drivers/net/wireless/intel/iwlwifi/mld/mld.c
@@ -671,14 +671,9 @@ iwl_mld_nic_error(struct iwl_op_mode *op_mode,
 		  enum iwl_fw_error_type type)
 {
 	struct iwl_mld *mld = IWL_OP_MODE_GET_MLD(op_mode);
-	bool trans_dead = iwl_trans_is_dead(mld->trans);
 
 	if (type == IWL_ERR_TYPE_CMD_QUEUE_FULL)
 		IWL_ERR(mld, "Command queue full!\n");
-	else if (!trans_dead && !mld->fw_status.do_not_dump_once)
-		iwl_fwrt_dump_error_logs(&mld->fwrt);
-
-	mld->fw_status.do_not_dump_once = false;
 
 	/* It is necessary to abort any os scan here because mac80211 requires
 	 * having the scan cleared before restarting.
@@ -709,6 +704,17 @@ iwl_mld_nic_error(struct iwl_op_mode *op_mode,
 	iwl_mld_cancel_async_notifications(mld);
 }
 
+static void iwl_mld_dump_error_logs(struct iwl_mld *mld,
+				    enum iwl_fw_error_type type)
+{
+	if (type != IWL_ERR_TYPE_CMD_QUEUE_FULL &&
+	    !iwl_trans_is_dead(mld->trans) &&
+	    !mld->fw_status.do_not_dump_once)
+		iwl_fwrt_dump_error_logs(&mld->fwrt);
+
+	mld->fw_status.do_not_dump_once = false;
+}
+
 static void iwl_mld_dump_error(struct iwl_op_mode *op_mode,
 			       struct iwl_fw_error_dump_mode *mode)
 {
@@ -717,11 +723,14 @@ static void iwl_mld_dump_error(struct iwl_op_mode *op_mode,
 	/* if we come in from opmode we have the mutex held */
 	if (mode->context == IWL_ERR_CONTEXT_FROM_OPMODE) {
 		lockdep_assert_wiphy(mld->wiphy);
+		iwl_mld_dump_error_logs(mld, mode->type);
 		iwl_fw_error_collect(&mld->fwrt);
 	} else {
 		wiphy_lock(mld->wiphy);
-		if (mode->context != IWL_ERR_CONTEXT_ABORT)
+		if (mode->context != IWL_ERR_CONTEXT_ABORT) {
+			iwl_mld_dump_error_logs(mld, mode->type);
 			iwl_fw_error_collect(&mld->fwrt);
+		}
 		wiphy_unlock(mld->wiphy);
 	}
 }
-- 
2.34.1

