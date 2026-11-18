Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794992173;
	b=G4GhjFt3bnRgNmtlG0aUm4/S5J883Vq/soy8ITc/JDzE90db25xBBfSP0r36TklTm8qD
	 iwI0KvkeJftQ7PuKw0YeMgkNu5zLzSlBEPoTxjKLptoKOBBxmRhBztjD2ZAv3vfjsBZob
	 xF/XgiPJ7F0u/1U4+794G00pdp4BBlm8SqihVibyr6xOU5AxXjX97RkU/etvfOF+epWvs
	 3FZxf97JbMH1sOO8SuALSFnzPbRHgAeOqgL8Jqipd6T2Z/M06kFLE19AMIv8SL3kcJRYh
	 eFV4D8X7SJAhJ6TFzyr9/7r38hXkhtDzihlkmA9rgyndY+oMU8Z7GBZKHNCec2rkcJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794992173;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Organization:Content-Transfer-Encoding;
	bh=wUfA2l5mxnlidUSI/TPmYmITOlEKBlef5NqpUXPMXbs=;
	b=ShVbF85abHRGo6sqhNlZeb87juPbYezNgd4WrND38v40xt50CCwAznw/CNJqWBRELvx4
	 fS/62BofSQFpCbxQ16pS6BwZWFkAS3iH9JfTPDRW8dhSzgdPtAXjGWcqHJyVulbCQkll5
	 m912RqC4vqSazC0upC4+KLsuBKZ1rVXlAh/m/oepXbrMVY0E8e6cjaRvJ/FG6/mb2C/7g
	 h5erMXGoB9aVDwZ22WO7gvVX0IMvPYsIPKoZaINzaj1X5ltM7PVO5KeAZYKKW45q8NVw9
	 Qgxa8G6QSNl7ymr2/mIFcHwDx82K13vUMVjcQU6DO6VjKNBarIN7UilDPkWmKr6We7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=P0Wn2Pc8;
	arc=none smtp.remote-ip=198.175.65.21
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCF40606A31C
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 08:56:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DCF40606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=P0Wn2Pc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794992173; x=1826528173;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=7EiUlabWlJ3y+O0QMgNvmsKHx2I9xyCelJzo4Iqmj7M=;
  b=P0Wn2Pc8Q5fbknHEaFkIppWB7cKTLiQSQKftCAVyQJ1SStq8G9PzYuKP
   vtEptXHHDsjhnhHXzKBBTCRoBeCoR8DNGrat/cM6f0MQAM7579IddD0I3
   pjmAra5tQ48oW5UN6N/YZ6Mk1zLAo500w3jlWsffn5EJZyU4VdZ8379Zn
   Jx1qGR9DLqysZKG3NcQbsw7+vKpGaYnMXIe7vYmNllooWUOM/MMnwhlF5
   X7g6ncprhE7MUBnVTCFNc8y9X/YVbX1Q/wVmQSC1nUKP4eNHRJS6tlhOi
   2jCVRFtWLtfx6LQ0s8yIjpyozdQwd6WxmwWHnYwJQSwA/MBXqZRjY+WLr
   w==;
X-CSE-ConnectionGUID: xBkEo9Z/TMawybEdQsPxwA==
X-CSE-MsgGUID: RQem0GSjT7uxnqbhSyKB4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3871971"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3871971"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 00:56:13 -0800
X-CSE-ConnectionGUID: vaiyuA9jQPKbpLkeLqV0OQ==
X-CSE-MsgGUID: 2EZKTh1nRqK5skxUm/zGZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="10000361"
Received: from weis0040.iil.intel.com ([10.12.217.108])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 00:56:11 -0800
From: Miri Korenblit <miriam.rachel.korenblit@intel.com>
To: miriam.rachel.korenblit@intel.com
Cc: linux-wireless@vger.kernel.org,
	Johannes Berg <johannes.berg@intel.com>,
	Emmanuel Grumbach <emmanuel.grumbach@intel.com>
Subject: [PATCH v2 iwlwifi-next 12/15] wifi: iwlwifi: don't send sync host commands from atomic context
Date: Wed, 18 Nov 2026 10:57:44 +0200
Message-Id: <20261118105612.e1beaa292023.I608d9635a5c427a0ba9e427f609cd3529517cd5a@changeid>
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

Some time points are reached from atomic context, e.g. FW_RSP_OR_NOTIF,
TX_FAILED, FAKE_TX, and more.
The debug commands of a time point are always sent synchronously,
which means that we sleep in atomic contexts.

The reason we didn't have issues so far is probably because we never had
to send hcmds in those timepoints.

Simply send the hcmd asynchrounously.

Assisted-by: LLM
Fixes: 3ed34fbf9d3b ("iwlwifi: dbg_ini: support FW response/notification region type")
Reviewed-by: Johannes Berg <johannes.berg@intel.com>
Reviewed-by: Emmanuel Grumbach <emmanuel.grumbach@intel.com>
Signed-off-by: Miri Korenblit <miriam.rachel.korenblit@intel.com>
---
 drivers/net/wireless/intel/iwlwifi/iwl-dbg-tlv.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/intel/iwlwifi/iwl-dbg-tlv.c b/drivers/net/wireless/intel/iwlwifi/iwl-dbg-tlv.c
index a64f958bbe5f..6636c21f3704 100644
--- a/drivers/net/wireless/intel/iwlwifi/iwl-dbg-tlv.c
+++ b/drivers/net/wireless/intel/iwlwifi/iwl-dbg-tlv.c
@@ -881,6 +881,7 @@ static void iwl_dbg_tlv_send_hcmds(struct iwl_fw_runtime *fwrt,
 		u16 hcmd_len = le32_to_cpu(node->tlv.length) - sizeof(*hcmd);
 		struct iwl_host_cmd cmd = {
 			.id = WIDE_ID(hcmd_data->group, hcmd_data->id),
+			.flags = CMD_ASYNC,
 			.len = { hcmd_len, },
 			.data = { hcmd_data->data, },
 		};
-- 
2.34.1

