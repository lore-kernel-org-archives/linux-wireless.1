Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=168.119.38.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795545184;
	b=YQmv1Iq3yhk33rZTM2XajUg7NBQEvEDIDXSiK2jfUI+k6HFm4GJIY6aQjH2EODgeCAw6
	 NR9pWYSLXNXfatug7ucMPfRdu0rRHwTEinpu2Y9CgLEdzzkHfb2BO2JWUbUjNL3CfFMQi
	 v+FTlPVeNQkt2ZpM41tXvbnFdEEZhPNZCwaTkMzAa+1AYMgkZs4GX7Iip2jA92aHqEFnR
	 u0i6bsZ9siTrNqMzJF9nzmXDTvHz0YkNp4pGFaSG2tWqngUPhnC0B8LRUC9R9q/9zR7Q8
	 bHSK5h+Cso0jJFSCDI3IB8lIwuDbjNxWhz2dWrrfenVsLxeqoGh/5b9qxI0WThcsq+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795545184;
	h=DKIM-Signature:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-malware-bazaar;
	bh=hmX5YfXVgZC+KsBawI7jVOwL85XHGRjgkqkZ078eIEY=;
	b=40vfotn/hXu06h/S4W/HoaoJEcpV9oE9RSd4m1UMXck3PfzYhyHDgSLA1oJAtnNehCsa
	 GwK9QQ3K5pJBYacvv/cWTARVwmTv9l7G/QpK8liJT1EDGhwnR7tE2Z5Jdy3eOA/HY/dmn
	 BIRVrqlTnU46hFaI3GNLkArHlPvENrjxVOo5WyMJP2D4T1SRIb9qTL+eBtM0LdNu71ePD
	 ItcQzA3dUUM8kdste9FwNQ8kjeLn503WeI17e8P8zU69bJk60feyUdLpD/OUb5m3u6zl1
	 3+d/BrBBXPLyPeo8Lr46V1vK1vlD+askX+5yRm3CQNJZpD202bl93hEoZ8KfR334ogQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=permerror header.from=sipsolutions.net;
	spf=pass smtp.mailfrom=sipsolutions.net;
	dkim=pass header.d=sipsolutions.net header.i=@sipsolutions.net header.a=rsa-sha256 header.s=mail header.b=kXXLI3yu;
	arc=none smtp.remote-ip=168.119.38.16
Received: from sipsolutions.net (s3.sipsolutions.net [168.119.38.16])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F46B606A31E
	for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 18:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=permerror header.from=sipsolutions.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sipsolutions.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sipsolutions.net header.i=@sipsolutions.net header.a=rsa-sha256 header.s=mail header.b=kXXLI3yu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-To:Resent-Cc:
	Resent-Message-ID:In-Reply-To:References;
	bh=hmX5YfXVgZC+KsBawI7jVOwL85XHGRjgkqkZ078eIEY=; t=1795545183; x=1796754783; 
	b=kXXLI3yurTi9L65XieDxVV9Eb7Oj0HWihRPN4eK7VzLqpWhWy8yq6/aRs19n0UZolEBI/ZlKf2g
	JyrumXKgjThsF9a7AMDxHJ2+m27CWUcmEoPjUiTRM7WWj/XKQB14S9s/4UTfrZ6EoymfMIPdIs3av
	9WxMEef0uPTPEsl+JDH7NJQnxWU1MUjJPUkA0V7K+bdB4IljNk2yNhAEHfb201KrC9X/CBfEjGyqn
	K80fwinyEScfRg7ypUYPiqzSguMQiSmHv1vakVCkgIjMDM8gLnnpvN+xo/Dgsb6v2npBy3rjXrwFp
	i27P+gf4wKpuoqWet7yWc92ff4VAih9tSNzg==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__ECDSA_SECP256R1_SHA256__AES_256_GCM:256)
	(Exim 4.98.2)
	(envelope-from <johannes@sipsolutions.net>)
	id 1xVvK8-0000000CeAn-22jA;
	Tue, 24 Nov 2026 19:33:00 +0100
From: Johannes Berg <johannes@sipsolutions.net>
To: linux-wireless@vger.kernel.org
Cc: Sergey Matyukevich <geomatsi@gmail.com>,
	Stefan Lippers-Hollmann <s.l-h@gmx.de>,
	Johannes Berg <johannes.berg@intel.com>
Subject: [PATCH wireless-next] wifi: qtnfmac: remove the driver
Date: Tue, 24 Nov 2026 19:32:55 +0100
Message-ID: <20261124183257.405801-2-johannes@sipsolutions.net>
X-Mailer: git-send-email 2.56.1
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-malware-bazaar: not-scanned

From: Johannes Berg <johannes.berg@intel.com>

Quantenna was acquired and shut down, and the IP has
(to anyone's knowledge) never been reused. Now their
domain has also lapsed and is spam/ads.

Sergey reminded me that we already discussed this a
few years ago, and Stefan Lippers-Hollmann then had
pointed out that despite code support for devices in
the wild, firmware was never available [1].

[1] https://lore.kernel.org/linux-wireless/20240228040255.0932ba6c@mir/

Remove the driver alltogether, it has only gotten
static checker fixes and a handful of API updates
since early 2020.

Signed-off-by: Johannes Berg <johannes.berg@intel.com>
---
 MAINTAINERS                                   |    7 -
 drivers/net/wireless/Kconfig                  |    1 -
 drivers/net/wireless/Makefile                 |    1 -
 drivers/net/wireless/quantenna/Kconfig        |   17 -
 drivers/net/wireless/quantenna/Makefile       |    7 -
 .../net/wireless/quantenna/qtnfmac/Kconfig    |   21 -
 .../net/wireless/quantenna/qtnfmac/Makefile   |   30 -
 drivers/net/wireless/quantenna/qtnfmac/bus.h  |  158 -
 .../net/wireless/quantenna/qtnfmac/cfg80211.c | 1298 --------
 .../net/wireless/quantenna/qtnfmac/cfg80211.h |   18 -
 .../net/wireless/quantenna/qtnfmac/commands.c | 2765 -----------------
 .../net/wireless/quantenna/qtnfmac/commands.h |   82 -
 drivers/net/wireless/quantenna/qtnfmac/core.c |  933 ------
 drivers/net/wireless/quantenna/qtnfmac/core.h |  159 -
 .../net/wireless/quantenna/qtnfmac/debug.c    |   23 -
 .../net/wireless/quantenna/qtnfmac/debug.h    |   37 -
 .../net/wireless/quantenna/qtnfmac/event.c    |  797 -----
 .../net/wireless/quantenna/qtnfmac/event.h    |   14 -
 .../wireless/quantenna/qtnfmac/pcie/pcie.c    |  493 ---
 .../quantenna/qtnfmac/pcie/pcie_priv.h        |   90 -
 .../quantenna/qtnfmac/pcie/pearl_pcie.c       | 1199 -------
 .../quantenna/qtnfmac/pcie/pearl_pcie_ipc.h   |   82 -
 .../quantenna/qtnfmac/pcie/pearl_pcie_regs.h  |  121 -
 .../quantenna/qtnfmac/pcie/topaz_pcie.c       | 1234 --------
 .../quantenna/qtnfmac/pcie/topaz_pcie_ipc.h   |   94 -
 .../quantenna/qtnfmac/pcie/topaz_pcie_regs.h  |   45 -
 .../net/wireless/quantenna/qtnfmac/qlink.h    | 1891 -----------
 .../wireless/quantenna/qtnfmac/qlink_util.c   |  303 --
 .../wireless/quantenna/qtnfmac/qlink_util.h   |   73 -
 .../wireless/quantenna/qtnfmac/qtn_hw_ids.h   |   35 -
 .../net/wireless/quantenna/qtnfmac/shm_ipc.c  |  162 -
 .../net/wireless/quantenna/qtnfmac/shm_ipc.h  |   65 -
 .../wireless/quantenna/qtnfmac/shm_ipc_defs.h |   33 -
 .../wireless/quantenna/qtnfmac/switchdev.h    |   24 -
 .../net/wireless/quantenna/qtnfmac/trans.c    |  213 --
 .../net/wireless/quantenna/qtnfmac/trans.h    |   44 -
 drivers/net/wireless/quantenna/qtnfmac/util.c |  123 -
 drivers/net/wireless/quantenna/qtnfmac/util.h |   34 -
 38 files changed, 12726 deletions(-)
 delete mode 100644 drivers/net/wireless/quantenna/Kconfig
 delete mode 100644 drivers/net/wireless/quantenna/Makefile
 delete mode 100644 drivers/net/wireless/quantenna/qtnfmac/Kconfig
 delete mode 100644 drivers/net/wireless/quantenna/qtnfmac/Makefile
 delete mode 100644 drivers/net/wireless/quantenna/qtnfmac/bus.h
 delete mode 100644 drivers/net/wireless/quantenna/qtnfmac/cfg80211.c
 delete mode 100644 drivers/net/wireless/quantenna/qtnfmac/cfg80211.h
 delete mode 100644 drivers/net/wireless/quantenna/qtnfmac/commands.c
 delete mode 100644 drivers/net/wireless/quantenna/qtnfmac/commands.h
 delete mode 100644 drivers/net/wireless/quantenna/qtnfmac/core.c
 delete mode 100644 drivers/net/wireless/quantenna/qtnfmac/core.h
 delete mode 100644 drivers/net/wireless/quantenna/qtnfmac/debug.c
 delete mode 100644 drivers/net/wireless/quantenna/qtnfmac/debug.h
 delete mode 100644 drivers/net/wireless/quantenna/qtnfmac/event.c
 delete mode 100644 drivers/net/wireless/quantenna/qtnfmac/event.h
 delete mode 100644 drivers/net/wireless/quantenna/qtnfmac/pcie/pcie.c
 delete mode 100644 drivers/net/wireless/quantenna/qtnfmac/pcie/pcie_priv.h
 delete mode 100644 drivers/net/wireless/quantenna/qtnfmac/pcie/pearl_pcie.c
 delete mode 100644 drivers/net/wireless/quantenna/qtnfmac/pcie/pearl_pcie_ipc.h
 delete mode 100644 drivers/net/wireless/quantenna/qtnfmac/pcie/pearl_pcie_regs.h
 delete mode 100644 drivers/net/wireless/quantenna/qtnfmac/pcie/topaz_pcie.c
 delete mode 100644 drivers/net/wireless/quantenna/qtnfmac/pcie/topaz_pcie_ipc.h
 delete mode 100644 drivers/net/wireless/quantenna/qtnfmac/pcie/topaz_pcie_regs.h
 delete mode 100644 drivers/net/wireless/quantenna/qtnfmac/qlink.h
 delete mode 100644 drivers/net/wireless/quantenna/qtnfmac/qlink_util.c
 delete mode 100644 drivers/net/wireless/quantenna/qtnfmac/qlink_util.h
 delete mode 100644 drivers/net/wireless/quantenna/qtnfmac/qtn_hw_ids.h
 delete mode 100644 drivers/net/wireless/quantenna/qtnfmac/shm_ipc.c
 delete mode 100644 drivers/net/wireless/quantenna/qtnfmac/shm_ipc.h
 delete mode 100644 drivers/net/wireless/quantenna/qtnfmac/shm_ipc_defs.h
 delete mode 100644 drivers/net/wireless/quantenna/qtnfmac/switchdev.h
 delete mode 100644 drivers/net/wireless/quantenna/qtnfmac/trans.c
 delete mode 100644 drivers/net/wireless/quantenna/qtnfmac/trans.h
 delete mode 100644 drivers/net/wireless/quantenna/qtnfmac/util.c
 delete mode 100644 drivers/net/wireless/quantenna/qtnfmac/util.h

diff --git a/MAINTAINERS b/MAINTAINERS
index deb7878202a4..4d56a30eb0e7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23345,13 +23345,6 @@ S:	Supported
 W:	https://wireless.docs.kernel.org/en/latest/en/users/drivers/wcn36xx.html
 F:	drivers/net/wireless/ath/wcn36xx/
 
-QUANTENNA QTNFMAC WIRELESS DRIVER
-M:	Igor Mitsyanko <imitsyanko@quantenna.com>
-R:	Sergey Matyukevich <geomatsi@gmail.com>
-L:	linux-wireless@vger.kernel.org
-S:	Maintained
-F:	drivers/net/wireless/quantenna/
-
 RADEON and AMDGPU DRM DRIVERS
 M:	Alex Deucher <alexander.deucher@amd.com>
 M:	Christian König <christian.koenig@amd.com>
diff --git a/drivers/net/wireless/Kconfig b/drivers/net/wireless/Kconfig
index f4f969fdbc02..978976ce8e85 100644
--- a/drivers/net/wireless/Kconfig
+++ b/drivers/net/wireless/Kconfig
@@ -37,7 +37,6 @@ source "drivers/net/wireless/silabs/Kconfig"
 source "drivers/net/wireless/st/Kconfig"
 source "drivers/net/wireless/ti/Kconfig"
 source "drivers/net/wireless/zydas/Kconfig"
-source "drivers/net/wireless/quantenna/Kconfig"
 
 source "drivers/net/wireless/virtual/Kconfig"
 
diff --git a/drivers/net/wireless/Makefile b/drivers/net/wireless/Makefile
index fa3100ff3bf7..26f471a92719 100644
--- a/drivers/net/wireless/Makefile
+++ b/drivers/net/wireless/Makefile
@@ -15,7 +15,6 @@ obj-$(CONFIG_WLAN_VENDOR_MICROCHIP) += microchip/
 obj-$(CONFIG_WLAN_VENDOR_MORSEMICRO) += morsemicro/
 obj-$(CONFIG_WLAN_VENDOR_NXP) += nxp/
 obj-$(CONFIG_WLAN_VENDOR_PURELIFI) += purelifi/
-obj-$(CONFIG_WLAN_VENDOR_QUANTENNA) += quantenna/
 obj-$(CONFIG_WLAN_VENDOR_RALINK) += ralink/
 obj-$(CONFIG_WLAN_VENDOR_REALTEK) += realtek/
 obj-$(CONFIG_WLAN_VENDOR_RSI) += rsi/
diff --git a/drivers/net/wireless/quantenna/Kconfig b/drivers/net/wireless/quantenna/Kconfig
deleted file mode 100644
index 91d78c68561f..000000000000
diff --git a/drivers/net/wireless/quantenna/Makefile b/drivers/net/wireless/quantenna/Makefile
deleted file mode 100644
index cea83d178d2e..000000000000
diff --git a/drivers/net/wireless/quantenna/qtnfmac/Kconfig b/drivers/net/wireless/quantenna/qtnfmac/Kconfig
deleted file mode 100644
index b4a6df06da54..000000000000
diff --git a/drivers/net/wireless/quantenna/qtnfmac/Makefile b/drivers/net/wireless/quantenna/qtnfmac/Makefile
deleted file mode 100644
index 40dffbd2ea47..000000000000
diff --git a/drivers/net/wireless/quantenna/qtnfmac/bus.h b/drivers/net/wireless/quantenna/qtnfmac/bus.h
deleted file mode 100644
index 7f8646e77ee0..000000000000
diff --git a/drivers/net/wireless/quantenna/qtnfmac/cfg80211.c b/drivers/net/wireless/quantenna/qtnfmac/cfg80211.c
deleted file mode 100644
index 139f67adead7..000000000000
diff --git a/drivers/net/wireless/quantenna/qtnfmac/cfg80211.h b/drivers/net/wireless/quantenna/qtnfmac/cfg80211.h
deleted file mode 100644
index c374857283ac..000000000000
diff --git a/drivers/net/wireless/quantenna/qtnfmac/commands.c b/drivers/net/wireless/quantenna/qtnfmac/commands.c
deleted file mode 100644
index 77929ed9ef78..000000000000
diff --git a/drivers/net/wireless/quantenna/qtnfmac/commands.h b/drivers/net/wireless/quantenna/qtnfmac/commands.h
deleted file mode 100644
index 72ad6ae5c750..000000000000
diff --git a/drivers/net/wireless/quantenna/qtnfmac/core.c b/drivers/net/wireless/quantenna/qtnfmac/core.c
deleted file mode 100644
index 0b5b60815c7f..000000000000
diff --git a/drivers/net/wireless/quantenna/qtnfmac/core.h b/drivers/net/wireless/quantenna/qtnfmac/core.h
deleted file mode 100644
index a377d85c2451..000000000000
diff --git a/drivers/net/wireless/quantenna/qtnfmac/debug.c b/drivers/net/wireless/quantenna/qtnfmac/debug.c
deleted file mode 100644
index 2d3574c1f10e..000000000000
diff --git a/drivers/net/wireless/quantenna/qtnfmac/debug.h b/drivers/net/wireless/quantenna/qtnfmac/debug.h
deleted file mode 100644
index 61b45536b83a..000000000000
diff --git a/drivers/net/wireless/quantenna/qtnfmac/event.c b/drivers/net/wireless/quantenna/qtnfmac/event.c
deleted file mode 100644
index fb5a56b6dd05..000000000000
diff --git a/drivers/net/wireless/quantenna/qtnfmac/event.h b/drivers/net/wireless/quantenna/qtnfmac/event.h
deleted file mode 100644
index 533ad99d045d..000000000000
diff --git a/drivers/net/wireless/quantenna/qtnfmac/pcie/pcie.c b/drivers/net/wireless/quantenna/qtnfmac/pcie/pcie.c
deleted file mode 100644
index 3adcfac2886f..000000000000
diff --git a/drivers/net/wireless/quantenna/qtnfmac/pcie/pcie_priv.h b/drivers/net/wireless/quantenna/qtnfmac/pcie/pcie_priv.h
deleted file mode 100644
index 2a6a928e13bd..000000000000
diff --git a/drivers/net/wireless/quantenna/qtnfmac/pcie/pearl_pcie.c b/drivers/net/wireless/quantenna/qtnfmac/pcie/pearl_pcie.c
deleted file mode 100644
index c1a53e1ba3be..000000000000
diff --git a/drivers/net/wireless/quantenna/qtnfmac/pcie/pearl_pcie_ipc.h b/drivers/net/wireless/quantenna/qtnfmac/pcie/pearl_pcie_ipc.h
deleted file mode 100644
index 634480fe6a64..000000000000
diff --git a/drivers/net/wireless/quantenna/qtnfmac/pcie/pearl_pcie_regs.h b/drivers/net/wireless/quantenna/qtnfmac/pcie/pearl_pcie_regs.h
deleted file mode 100644
index 6e9a5c61d46f..000000000000
diff --git a/drivers/net/wireless/quantenna/qtnfmac/pcie/topaz_pcie.c b/drivers/net/wireless/quantenna/qtnfmac/pcie/topaz_pcie.c
deleted file mode 100644
index 2e00bf68d001..000000000000
diff --git a/drivers/net/wireless/quantenna/qtnfmac/pcie/topaz_pcie_ipc.h b/drivers/net/wireless/quantenna/qtnfmac/pcie/topaz_pcie_ipc.h
deleted file mode 100644
index eb30e9d08de2..000000000000
diff --git a/drivers/net/wireless/quantenna/qtnfmac/pcie/topaz_pcie_regs.h b/drivers/net/wireless/quantenna/qtnfmac/pcie/topaz_pcie_regs.h
deleted file mode 100644
index 4782e1ed3c2c..000000000000
diff --git a/drivers/net/wireless/quantenna/qtnfmac/qlink.h b/drivers/net/wireless/quantenna/qtnfmac/qlink.h
deleted file mode 100644
index eae35b678952..000000000000
diff --git a/drivers/net/wireless/quantenna/qtnfmac/qlink_util.c b/drivers/net/wireless/quantenna/qtnfmac/qlink_util.c
deleted file mode 100644
index 30b60d6ae546..000000000000
diff --git a/drivers/net/wireless/quantenna/qtnfmac/qlink_util.h b/drivers/net/wireless/quantenna/qtnfmac/qlink_util.h
deleted file mode 100644
index 230a10a41c7a..000000000000
diff --git a/drivers/net/wireless/quantenna/qtnfmac/qtn_hw_ids.h b/drivers/net/wireless/quantenna/qtnfmac/qtn_hw_ids.h
deleted file mode 100644
index 82d879950b62..000000000000
diff --git a/drivers/net/wireless/quantenna/qtnfmac/shm_ipc.c b/drivers/net/wireless/quantenna/qtnfmac/shm_ipc.c
deleted file mode 100644
index ff678951d3b2..000000000000
diff --git a/drivers/net/wireless/quantenna/qtnfmac/shm_ipc.h b/drivers/net/wireless/quantenna/qtnfmac/shm_ipc.h
deleted file mode 100644
index 52cac5439b03..000000000000
diff --git a/drivers/net/wireless/quantenna/qtnfmac/shm_ipc_defs.h b/drivers/net/wireless/quantenna/qtnfmac/shm_ipc_defs.h
deleted file mode 100644
index 78be70df1218..000000000000
diff --git a/drivers/net/wireless/quantenna/qtnfmac/switchdev.h b/drivers/net/wireless/quantenna/qtnfmac/switchdev.h
deleted file mode 100644
index b962e670c4b0..000000000000
diff --git a/drivers/net/wireless/quantenna/qtnfmac/trans.c b/drivers/net/wireless/quantenna/qtnfmac/trans.c
deleted file mode 100644
index 95356e280e23..000000000000
diff --git a/drivers/net/wireless/quantenna/qtnfmac/trans.h b/drivers/net/wireless/quantenna/qtnfmac/trans.h
deleted file mode 100644
index c0b76f871b31..000000000000
diff --git a/drivers/net/wireless/quantenna/qtnfmac/util.c b/drivers/net/wireless/quantenna/qtnfmac/util.c
deleted file mode 100644
index 4ad66cc1804d..000000000000
diff --git a/drivers/net/wireless/quantenna/qtnfmac/util.h b/drivers/net/wireless/quantenna/qtnfmac/util.h
deleted file mode 100644
index a14b7078a9c7..000000000000
-- 
2.56.1

