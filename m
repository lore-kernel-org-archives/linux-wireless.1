Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794864115;
	b=RguCur58iwNXGdjhHQ/7HwyiWLGzIl46yD0/WqjxVA5T9WzHoITHeApGAOHGJ+5SEryi
	 hQQLOLS9qi8CNvSSXw33FO2b88IZ6m7l8odU9Im94kYtaajlAn/d5NQ4qb8zPQQ5WuWHh
	 bmeKvtjA6L7gaZOQ8XBQT4ScYvO9Re9eBAIsK8Lr1mYnYbNdkVLsfUQ9zcm3NS9RiGx+4
	 q81CTI20LjCYLgKPYRFuNWvYFArRnMWPZoklCnfUR96aqnHjR/Xql28H74jyllAucemhr
	 rxcRuOTe3ITUVchr72R8JpbV3QNnWMMJBJFH7DQcn2loxc1SYO7LHqP9G9UC4xBMltA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794864115;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Organization:Content-Transfer-Encoding;
	bh=aXJIdeKgB/y/v9VsoxHbKoAEiZIb/HV/Q7gi7iFtvC0=;
	b=MO7PjtciE6mtRoxSCJmo3tfD5oFc/h9UwFGGaeI6HtN1cAQjiCr81msTSJvgFLuCnUoM
	 yQeJ1FlPkV9DaRyQXNLp9NvaAX4LQck1M3JgKdeZqKx5Hticv8mtht56cN0rqtJEIu3ES
	 JdtLmkhE/dqAC6FOoGDRRIxhlomG+031oAW975PTBOvgjm8fgCphZDM2U/5sTk95SS8Dt
	 nvUi2CTTpyTl9swupExDKJuCxGXx6czWBLcBmr70SmnPGDZx0+X58Y85SGlH6QvTXfJK2
	 s+A/Eik4uxMME6qqZiHt9ir9koLHybjJ060uX8ebYY5RErdtcjaVvBMgfAOYRB4UAzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ehzdIDlV;
	arc=none smtp.remote-ip=192.198.163.13
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91DBD606A335
	for <linux-wireless@vger.kernel.org>; Mon, 16 Nov 2026 21:21:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91DBD606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ehzdIDlV
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794864114; x=1826400114;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=XqD+ytfIXJHqmadqcNZci9CuvLDotT9xl1Zi5/ZYOHI=;
  b=ehzdIDlVrKEj8SRFA1ji4oR4OhfuCv23UBr+lqOorInx5z0nP7ovtTUw
   SjaiRwhl2s8ZbgCil8ZShZ1CLgbJ4SuPOOXCcMkACcdrRbuJX5XxN6AzL
   hP0vCSJQoQTq63Ig0AmfUr60cux5/eFV1LrI8cwQsgAg9XbXxwEtM509c
   iR7naF6NtXmKYJnjxH2953pNwi14NupH/lL+WjrqSNMdS90MNf5mv6w3w
   mbFaXuN03pXQrocoIbDgcdZu+mgyjTJJULwMzSG5QTi7XoDmcxi/bL38n
   XaQGxI2Gh8tzjyBS4p2ftCYDE/Ob/NyoAcFmRkmNYAbHJUQezbUS7d73C
   A==;
X-CSE-ConnectionGUID: 0zDfzKZ3TjKl+KUi1He4pQ==
X-CSE-MsgGUID: 3/F9KbOzRJKdZKUjYPyegA==
X-IronPort-AV: E=McAfee;i="6800,10657,11968"; a="3604202"
X-IronPort-AV: E=Sophos;i="6.27,217,1787036400"; 
   d="scan'208";a="3604202"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 13:21:54 -0800
X-CSE-ConnectionGUID: aDsemDF5Thy1sMHdA6Vl+A==
X-CSE-MsgGUID: lMvFZusQSP2d/kxUB4HLyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,217,1787036400"; 
   d="scan'208";a="9969144"
Received: from weis0040.iil.intel.com ([10.12.217.108])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 13:21:53 -0800
From: Miri Korenblit <miriam.rachel.korenblit@intel.com>
To: miriam.rachel.korenblit@intel.com
Cc: linux-wireless@vger.kernel.org,
	Johannes Berg <johannes.berg@intel.com>
Subject: [PATCH iwlwifi-next 10/15] wifi: iwlwifi: mld: dump the FW error logs from dump_error
Date: Mon, 16 Nov 2026 23:23:28 +0200
Message-Id: <20261116232138.3a171bd66b0a.Ie743c51b74024019c00d176fa650a439830b1301@changeid>
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

