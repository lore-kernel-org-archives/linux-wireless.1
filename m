Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.216.248.207
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795783280;
	b=bCPtDKRLq0lDdR7Znkb91QH1ZPK8pLUit0qUot5R99C7/7nJtetQrMBBVqiPHttbvd69
	 R7zK7XNbrkWWLCJM9UNxS2a4yCj5hQlvgE8cMNmHPmUBv5h2DGxdZ/iUOIjBjiYN4SzeU
	 5i8gjEzcYlNNxBFXpolhx7iOBwhxmWaOPNvwNr9VgVskECHCuc1RDGuYxswqEkFCeWWko
	 45FFGai70GP4dXfWLb5R/w9DtwJMJwdtkhsIkPDne4Mkcr6sjVk27IdsoPlZNey2Sjoop
	 3pvQ0d74nP5oZ6lzbIJ9wK9SBreNh+VlWReYgYizoWcxrG6lbU7nxKwwtL3Rh47WA4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795783280;
	h=DMARC-Filter:From:DKIM-Signature:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=f2IKiIgwrwPhZnKxMWhFMgyWeawmFybOA5SI2KKPvfQ=;
	b=G9sOBdtmXL5Gylf/B58IwWOsV7Zo9MWPMQl7eBdfcctCJf9O6qsQ04AnD+5nLQBmY4Xw
	 g7d7/CTACJVAQIBgI8U/MwIWMSihjcK5EfaffI/Xf5QAE8A4v5Jfz7T4uBr47o+umK5nT
	 wGocZlL3A7LATnp1sNDr5X/zWovBubnYF9LzG9iHyOnYWq6IhfnsXUEVFdcOK5EkIm/aQ
	 LZnBJLCBFhU69mT9kbaLzsd+eyAsy5CpmJlWAvAPzubteLfL5urY4+jbToTu8YjhBJM+b
	 fbQ9Zgosl796XpfPxY7AZjipCe5o+cbvfUQmRI6oKDEw4jcf3aGHXn0dCfsuKHbkcuw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=deq.rocks;
	spf=none smtp.mailfrom=deq.rocks;
	dkim=pass header.d=deq.rocks header.i=@deq.rocks header.a=rsa-sha256 header.s=securedbylima-20251205 header.b=RxtkvXto;
	arc=none smtp.remote-ip=91.216.248.207
Received: from mx5.mail-out.lima-city.de (mx5.mail-out.lima-city.de [91.216.248.207])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D2E3606A32C;
	Fri, 27 Nov 2026 12:41:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6D2E3606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=deq.rocks
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=deq.rocks
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=deq.rocks header.i=@deq.rocks header.a=rsa-sha256 header.s=securedbylima-20251205 header.b=RxtkvXto
From: Andre Eikmeyer <dev@deq.rocks>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=deq.rocks;
	s=securedbylima-20251205; t=1795783271;
	bh=3sGLL6APmhRqO/jkfKMLi1YXNpdQbllVfhOQGjaHsKs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RxtkvXtoYAdpuSFziE7Z2GpOxvlovwv8BJrIfFXGmg8L6WwgRa492F3CmgDLNmpkA
	 DehDkAEcKUCdQtyv1cf1AzP0r9DtW/zW2QonDSZc5FSGMXRqRf6yau1pwhNz9wVb+B
	 c+4haVm9hELexfEY+vYuoEZVkMqdmBI9r1b3EoCyr/D495Uf9ODNgdHZ8U4GRm8YaE
	 8FEj/bR3AnEsnYX2AzayX9O2hFiDvKuUGbTEQSWqnVuzJ+MluEVp1SQX8PW2VD1gjx
	 PxeUI+r2K3OvkZcP0jcuYb1jJPisaMyPh6b+fhbotRdR6R9p9q/eTFLOFwudq7+quP
	 NQhuV5ScMBaMQ==
To: arend.vanspriel@broadcom.com
Cc: linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	Sasha Finkelstein <k@chaosmail.tech>,
	Sven Peter <sven@kernel.org>,
	Janne Grunau <j@jannau.net>,
	Aditya Garg <aditya.garg@linux.dev>,
	Andre Eikmeyer <dev@deq.rocks>,
	Yossef Osman <Yossef.Osman@proton.me>
Subject: [PATCH wireless-next v3 1/6] wifi: brcmfmac: move the interface_create definitions to fwil_types.h
Date: Fri, 27 Nov 2026 13:40:59 +0100
Message-ID: <20261127124104.233236-2-dev@deq.rocks>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261127124104.233236-1-dev@deq.rocks>
References: <20261127124104.233236-1-dev@deq.rocks>
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The interface_create iovar structures and flags are firmware interface
types like the others in fwil_types.h. Move them there so code outside
cfg80211.c can create firmware interfaces as well.

Tested-by: Yossef Osman <Yossef.Osman@proton.me>
Tested-by: Aditya Garg <aditya.garg@linux.dev>
Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>
Signed-off-by: Andre Eikmeyer <dev@deq.rocks>
---
 .../broadcom/brcm80211/brcmfmac/cfg80211.c    | 42 ------------------
 .../broadcom/brcm80211/brcmfmac/fwil_types.h  | 43 +++++++++++++++++++
 2 files changed, 43 insertions(+), 42 deletions(-)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c
index 57689026525e..2035535b753f 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c
@@ -271,48 +271,6 @@ struct parsed_vndr_ies {
 	struct parsed_vndr_ie_info ie_info[VNDR_IE_PARSE_LIMIT];
 };
 
-#define WL_INTERFACE_CREATE_VER_1		1
-#define WL_INTERFACE_CREATE_VER_2		2
-#define WL_INTERFACE_CREATE_VER_3		3
-#define WL_INTERFACE_CREATE_VER_MAX		WL_INTERFACE_CREATE_VER_3
-
-#define WL_INTERFACE_MAC_DONT_USE	0x0
-#define WL_INTERFACE_MAC_USE		0x2
-
-#define WL_INTERFACE_CREATE_STA		0x0
-#define WL_INTERFACE_CREATE_AP		0x1
-
-struct wl_interface_create_v1 {
-	u16	ver;			/* structure version */
-	u32	flags;			/* flags for operation */
-	u8	mac_addr[ETH_ALEN];	/* MAC address */
-	u32	wlc_index;		/* optional for wlc index */
-};
-
-struct wl_interface_create_v2 {
-	u16	ver;			/* structure version */
-	u8	pad1[2];
-	u32	flags;			/* flags for operation */
-	u8	mac_addr[ETH_ALEN];	/* MAC address */
-	u8	iftype;			/* type of interface created */
-	u8	pad2;
-	u32	wlc_index;		/* optional for wlc index */
-};
-
-struct wl_interface_create_v3 {
-	u16 ver;			/* structure version */
-	u16 len;			/* length of structure + data */
-	u16 fixed_len;			/* length of structure */
-	u8 iftype;			/* type of interface created */
-	u8 wlc_index;			/* optional for wlc index */
-	u32 flags;			/* flags for operation */
-	u8 mac_addr[ETH_ALEN];		/* MAC address */
-	u8 bssid[ETH_ALEN];		/* optional for BSSID */
-	u8 if_index;			/* interface index request */
-	u8 pad[3];
-	u8 data[];			/* Optional for specific data */
-};
-
 static u8 nl80211_band_to_fwil(enum nl80211_band band)
 {
 	switch (band) {
diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/fwil_types.h b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/fwil_types.h
index 37d9414546d5..973598d43368 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/fwil_types.h
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/fwil_types.h
@@ -1375,4 +1375,47 @@ struct brcmf_eventmsgs_ext_le {
 	u8 mask[] __counted_by(len);
 };
 
+/* interface_create iovar */
+#define WL_INTERFACE_CREATE_VER_1		1
+#define WL_INTERFACE_CREATE_VER_2		2
+#define WL_INTERFACE_CREATE_VER_3		3
+#define WL_INTERFACE_CREATE_VER_MAX		WL_INTERFACE_CREATE_VER_3
+
+#define WL_INTERFACE_MAC_DONT_USE	0x0
+#define WL_INTERFACE_MAC_USE		0x2
+
+#define WL_INTERFACE_CREATE_STA		0x0
+#define WL_INTERFACE_CREATE_AP		0x1
+
+struct wl_interface_create_v1 {
+	u16	ver;			/* structure version */
+	u32	flags;			/* flags for operation */
+	u8	mac_addr[ETH_ALEN];	/* MAC address */
+	u32	wlc_index;		/* optional for wlc index */
+};
+
+struct wl_interface_create_v2 {
+	u16	ver;			/* structure version */
+	u8	pad1[2];
+	u32	flags;			/* flags for operation */
+	u8	mac_addr[ETH_ALEN];	/* MAC address */
+	u8	iftype;			/* type of interface created */
+	u8	pad2;
+	u32	wlc_index;		/* optional for wlc index */
+};
+
+struct wl_interface_create_v3 {
+	u16 ver;			/* structure version */
+	u16 len;			/* length of structure + data */
+	u16 fixed_len;			/* length of structure */
+	u8 iftype;			/* type of interface created */
+	u8 wlc_index;			/* optional for wlc index */
+	u32 flags;			/* flags for operation */
+	u8 mac_addr[ETH_ALEN];		/* MAC address */
+	u8 bssid[ETH_ALEN];		/* optional for BSSID */
+	u8 if_index;			/* interface index request */
+	u8 pad[3];
+	u8 data[];			/* Optional for specific data */
+};
+
 #endif /* FWIL_TYPES_H_ */
-- 
2.56.0

