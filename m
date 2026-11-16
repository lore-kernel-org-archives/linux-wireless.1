Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794864101;
	b=UMyqDL1eAKADa6KVZKwD5dayTks7j0lEAUpO/RULg9Ta9P02WDtTn7ilhn0ciO98XXxy
	 S5FXxoLCnNW07OU9pfym6UcaOkhudI7OfpnNi5sUfWYpvpu2boPTAk++8dw3BSZJJmCnE
	 k5Hm7pOuZsnH1JAMi5qE+eIq8GYu9OehqPpKT9xJcsj64mKei6tcYXVAdzEkcF2pXPxf2
	 BCOi/ezKpro8FJ3o7muAPKqWAkXVX/l6GuGBB0b2Jccy/2Kcdg3Vov6jG7lhCj1GyfQYn
	 N5E5LIn296O9QZ/rsZzqTi840+owpLtinL6AIR9jFTcsDxlfoWpjewJ4nkgAZEkiv4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794864101;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:MIME-Version:Organization:
	 Content-Transfer-Encoding;
	bh=gaU4V5QT2XafotkQ4bGWfJ1U/5AAyiLVaqJmVjhEYXs=;
	b=D9fQ1WZq2C+IRYnqP8c/uQ6th9RQV5bUfItvSfHriYxM7wB6Y/Rect31wddM9HNkoBMY
	 Pdtzl7aiUIUI1XwEbDcF3UWSJWBtUq3JXDDooJ2pUzav4d/I54MJ1Ee3VOsb3Vayrsjl7
	 08CvSbHH5XEcDWkUl9HqarPmJhVk9kf1pLIBeL/G0ODIqAbNWYlzSXRjB25R3D263Iglq
	 xu1UOsqYTbcSl0NoKIwvNgc4Ftc2W6VmDGTGRLS+eNDLHl3sfyINDNT6EeKdZi6vtsxPL
	 r3fXFGswZbO2Qh2qKhY1ePy1azA8N7fnIuPa627C4DcfYOqFkgyL+1K1kYUfdRABEYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=AFmYUse8;
	arc=none smtp.remote-ip=192.198.163.13
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1473606A322
	for <linux-wireless@vger.kernel.org>; Mon, 16 Nov 2026 21:21:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1473606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=AFmYUse8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794864101; x=1826400101;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=roOiGzKbJnNzWQWvM0JQZNAi8GyiRoQFVNx4StucNYs=;
  b=AFmYUse80RLyoKrSrsugPxTXoGtdGO1QqrOOZ/JE6z+go4GBoa9TZKc8
   CNcVjKUUta2Lh0d+nY9vEOCbNeknxRbmKLOX8ieZx6GZKhrbqQ23uAJuR
   tkYwyz4tpfR3DKiB3rGvsJ/CsZ+dz9dENBNNI3tc6CrHit9y3bFuzPrtR
   SpLlps11XGWJ3CZyWr0Kgv0Yd8uHyTB+HpL44CuWN/Z+JRQV02PVMNnfC
   gOAKs5LNOjlo5o9F+UfmKy6kSDso2qAooHfKZUEJkiDJRz9Cpg8/DOa33
   RYSIxUpxYdZhZ+4LANCZtVJqQeGl43++hU8Ss+P0+8la249oU4/4iRJsf
   g==;
X-CSE-ConnectionGUID: ustrU5OERAu58MfjIRKdTQ==
X-CSE-MsgGUID: mrykJrNPS/W8pS7aJ31ziA==
X-IronPort-AV: E=McAfee;i="6800,10657,11968"; a="3604182"
X-IronPort-AV: E=Sophos;i="6.27,217,1787036400"; 
   d="scan'208";a="3604182"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 13:21:40 -0800
X-CSE-ConnectionGUID: HHOO3aw9R9e0kAbXIJlJdw==
X-CSE-MsgGUID: SxdyXMB8RN2Q5kZA4lyObg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,217,1787036400"; 
   d="scan'208";a="9969071"
Received: from weis0040.iil.intel.com ([10.12.217.108])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 13:21:39 -0800
From: Miri Korenblit <miriam.rachel.korenblit@intel.com>
To: miriam.rachel.korenblit@intel.com
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH iwlwifi-next 00/15] wifi: iwlwifi: updates - 2026-11-16
Date: Mon, 16 Nov 2026 23:23:18 +0200
Message-Id: <20261116212333.2404653-1-miriam.rachel.korenblit@intel.com>
X-Mailer: git-send-email 2.34.1
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

Hi,
Usual features, fixes and cleanups from our internal tree.

Thanks,
Miri
---

Benjamin Berg (2):
  wifi: iwlwifi: mld: handle CIP key installation
  wifi: iwlwifi: mld: enable Control Integrity Protocol support

Emmanuel Grumbach (3):
  wifi: iwlwifi: mld: set cip_defer before association
  wifi: iwlwifi: mld: support CIGTK rekey in D3
  wifi: iwlwifi: stop the firmware completely after the reset handshake

Johannes Berg (2):
  wifi: iwlwifi: mld: request per-STA GTKs for the AP
  wifi: iwlwifi: partially enable context analysis

Miri Korenblit (6):
  wifi: iwlwifi: rename IWL_MAX_CMD_TBS_PER_TFD
  wifi: iwlwifi: mld: dump the FW error logs from dump_error
  wifi: iwlwifi: dbg: rename the time point sync argument
  wifi: iwlwifi: don't send sync host commands from atomic context
  wifi: iwlwifi: mld: PHC: don't read GP2 under the PTP spinlock
  wifi: iwlwifi: mld: take the PTP lock for the monitor timestamp

Pagadala Yesu Anjaneyulu (2):
  wifi: iwlwifi: move UEFI GUID lock status to transport
  wifi: iwlwifi: add PDGC platform config reader

 drivers/net/wireless/intel/iwlwifi/Makefile   |   2 +
 drivers/net/wireless/intel/iwlwifi/fw/acpi.c  |  43 ++++-
 drivers/net/wireless/intel/iwlwifi/fw/acpi.h  |  16 +-
 .../wireless/intel/iwlwifi/fw/api/datapath.h  |   2 +
 .../net/wireless/intel/iwlwifi/fw/dbg-old.c   |   3 +
 drivers/net/wireless/intel/iwlwifi/fw/dbg.c   |  21 +++
 drivers/net/wireless/intel/iwlwifi/fw/init.c  |   2 -
 .../wireless/intel/iwlwifi/fw/notif-wait.c    |   7 +-
 .../wireless/intel/iwlwifi/fw/notif-wait.h    |  20 ++-
 .../wireless/intel/iwlwifi/fw/regulatory.c    |  28 +++-
 .../wireless/intel/iwlwifi/fw/regulatory.h    |   4 +-
 .../net/wireless/intel/iwlwifi/fw/runtime.h   |   4 -
 drivers/net/wireless/intel/iwlwifi/fw/uefi.c  |  52 ++++--
 drivers/net/wireless/intel/iwlwifi/fw/uefi.h  |  22 ++-
 .../net/wireless/intel/iwlwifi/iwl-dbg-tlv.c  |  22 ++-
 .../net/wireless/intel/iwlwifi/iwl-dbg-tlv.h  |   2 +-
 .../intel/iwlwifi/iwl-devtrace-iwlwifi.h      |   4 +-
 .../wireless/intel/iwlwifi/iwl-nvm-parse.c    |   3 +
 .../net/wireless/intel/iwlwifi/iwl-trans.c    |  10 +-
 .../net/wireless/intel/iwlwifi/iwl-trans.h    |  38 +++--
 drivers/net/wireless/intel/iwlwifi/mld/d3.c   | 158 +++++++++++-------
 drivers/net/wireless/intel/iwlwifi/mld/key.c  |  49 +-----
 drivers/net/wireless/intel/iwlwifi/mld/key.h  |   6 +-
 .../net/wireless/intel/iwlwifi/mld/mac80211.c |  44 +++--
 drivers/net/wireless/intel/iwlwifi/mld/mld.c  |  21 ++-
 drivers/net/wireless/intel/iwlwifi/mld/ptp.c  |  10 +-
 .../wireless/intel/iwlwifi/mld/regulatory.c   |   2 -
 drivers/net/wireless/intel/iwlwifi/mld/rx.c   |  11 +-
 drivers/net/wireless/intel/iwlwifi/mld/sta.c  |  31 +++-
 drivers/net/wireless/intel/iwlwifi/mvm/fw.c   |   2 -
 .../wireless/intel/iwlwifi/pcie/internal.h    |  18 +-
 .../wireless/intel/iwlwifi/pcie/trans-gen2.c  |   3 +
 .../net/wireless/intel/iwlwifi/pcie/trans.c   |   6 +
 .../net/wireless/intel/iwlwifi/pcie/tx-gen2.c |  10 +-
 drivers/net/wireless/intel/iwlwifi/pcie/tx.c  |  12 +-
 .../net/wireless/intel/iwlwifi/pcie/utils.h   |   7 +-
 36 files changed, 452 insertions(+), 243 deletions(-)

-- 
2.34.1

