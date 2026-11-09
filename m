Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794246273;
	b=rew30Zbh6dNlt4vOmPd8DiWHyn5iRTF6rcX0RgQ7vbbnkzeQFcIUXfX+oAq1Q6aS5fxy
	 8L3yXDT+IzLfBh2ByPM9mM3CyBiQBUbyxlInm+intgf53pd7JbmIJBtVEYpU/4OtDYbB1
	 zd+U/gdBzfECcw4TedxkfEamH8lWGSB0BEKv+LuYmP82SRKFalCXWZyr2DrJiwZAdnLSm
	 WUi3RYQltJXVejKguM6/22/B45xTaLmSwWQNlnO0i8gbZ9tLszAG8/IcMyPuKxqREVxok
	 hbZHrUYMG3VBVqwpyxHEgEbJzJXCGEjT6c2BpeXY3TyipwXA8vv/GgwP/ke74+aA8ZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794246273;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=ZIgtguijiaaTJtLuFGmVkx5hp310kRchRojrdQdcBGo=;
	b=hseXP9uXbir6O6/kdbOC72N4aKvhbOOQF+8cbayQ4bMZSHUixcdfI2reDkYgdrlWv/Sf
	 56IWTtbvgxLZpBzsCdmTwIKbnTqDbhyvKIlLo3Fib7i6z51Y0Ve562peGiNHYgLLcfW/l
	 GWERF7Fm98aR2luU/6SDcw/Sfx1Ua3ey0Y7rwn1C8LYcNrUrCFmBnNbtQpkKer0zdAUuW
	 5DlCPgIedIaUyJp2GiKPlfHp/lAqrxdArfMU774Q5xOWItQjb+n5cJ8gSdCYXpr652+tZ
	 QqUt3KKUyips7f5FPmGQTyNieGPVYPAykprweK+0AFIDbrj8cjZ+tPDWb5EWAeYjKJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GvtZLdGd;
	arc=none smtp.remote-ip=209.85.208.50
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D249A606A331
	for <linux-wireless@vger.kernel.org>; Mon,  9 Nov 2026 17:44:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D249A606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GvtZLdGd
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6afbc363efeso1649232a12.3
        for <linux-wireless@vger.kernel.org>; Mon, 09 Nov 2026 09:44:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794246271; x=1794851071; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZIgtguijiaaTJtLuFGmVkx5hp310kRchRojrdQdcBGo=;
        b=GvtZLdGdMA/+Wz3RMcQQ24XuloJXS3yOcdE4/lR/9y6C6dOfk5+VNBNaZjTYB4GRNN
         GFQ+NIB8yI7xrR1fW4sFwnO9+Bfn1eYD0Uaewe36a1ujkSLskQ9nuHeC/1x9OkL5Xv7P
         higM68vobBFKo2c0CZ0gjE+NaSJbG1dDSBmXDjr63dev0i9Yw+U4MqcP5wFmZV8IwVQa
         mmL9tR9PHSnAJTSxWeor87zif+AH9zr0NmoCav51sH+dlALJh0K7/evEUoXcpFAFxbEE
         k6vJPKhMfWM8XD0+zcxRoELEKjeNET0WszjPLjpZosRTY0t7yU8L1Yid+17j6QPv/UXU
         G+SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794246271; x=1794851071;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZIgtguijiaaTJtLuFGmVkx5hp310kRchRojrdQdcBGo=;
        b=qFDiwMAbmnmMpPPc+moWBM6BBra7rrnQSnXyqT/6/SufpVJCTXDobjeHVdXGrIDMbt
         puYz+xQ2+7iScaCVXTtEn2Vi3HGwzn95O18L3pd3OTe8cW25H5Fdoffh7qwLsj9xuLoV
         WXjqAAZqqcZAreKJlyzIgr/lnbJokRLeudkZaeIFWjxgj6/zM/kPfiBFkzp5GlmT0bO3
         fIwoc7GYSkO7Orjyp2yZRrJwR0d5f7LmWM8pgPBsGxRKXwFW1jhIFdGSOrK++VTAdStd
         I6eL8uO64pENzS/ld3UaCaakfdP6dxjrm7l5OZX1vhsTZk99S+UM3VxebjrnFZznyE8p
         QEuA==
X-Gm-Message-State: APuU4Z+Iv+TkEa9pEOWI0KE+IEAG0PdZfeWa6Is4t+J/VNNBlAWDq0fi
	1iLEDxTfeSjjxcV+p/LxmFEa3EV1w8kZecLlW+/HdGd9IYnFKfg/u6TQ3xQwBauq
X-Gm-Gg: AYBFou3ELnXboIOoV8wZFzsEKD/2qmZYT0z/0SXYNNGTahvfnJ/8Vn0iexJEL033ho1
	gHQAH9QmUXR/tOYW+aDIorF6BL98AxFDAWMZ1KF0bI2zsp1fDuGZfc12IEOsaxdFdnB0F/qW0dI
	Jr+ccPyJu9Ry+tj1Izpi892b9AKwIlZzNP2n3INLd+yDZxZ238i0UlHJWIi/ubFVs20lq0Qp9LD
	iqI0xy5c3UcDMDV45awB0qIBdx/3znp/vTtT0iyOKTCRjALgwkgd3Xiw3FnwJbiVjhMlTfKXgZC
	rHD+oAu9o5BSBTZmCFVRmRXtMdg8ZMTENdqPj78UgT0GA4LxYortF0y9E5YelSnXIjZK2W976rx
	I/asgQS8pu8yy5YzsB4p0AaY0nr95AqAVCD2eFq2lxMjeNL3k7z77PxmhcWmWtYLo5k6Lp5ShxH
	lbIqiiT00NvWXnlj5Dvpk+LKq/S/3HazC3KxM9Oj21IPPJSiBK8wCHtnidZ9PfOVWS9QrHQRqv+
	lSJRjByhZNmrh2ohpN15z0zLv89eayfnboehl5m7J4HJ9Q/S3847PCCI0j1EjQkAMPNAYFQzygc
	tXIk0yTYgkT5cJ0ebNXokVmKon3TnlvCe0vbg6XjrJi/mHm0WvXkZQDHm4TspByWNHWapw==
X-Received: by 2002:a05:6402:360f:b0:6b1:ce0f:eb6b with SMTP id 4fb4d7f45d1cf-6b756aea03fmr291538a12.31.1794246271039;
        Mon, 09 Nov 2026 09:44:31 -0800 (PST)
Received: from localhost.localdomain ([80.248.138.39])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b721e3c8bfsm1902499a12.3.2026.11.09.09.44.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 09:44:30 -0800 (PST)
From: "Kordian Chmielewski (mlody1212)" <kudzo51@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: arend.vanspriel@broadcom.com,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	"Kordian Chmielewski (mlody1212)" <kudzo51@gmail.com>
Subject: [PATCH wireless-next] wifi: brcmfmac: delete the flowrings of an AP that stops or goes down
Date: Mon,  9 Nov 2026 18:44:10 +0100
Message-ID: <20261109174410.1530720-1-kudzo51@gmail.com>
X-Mailer: git-send-email 2.56.0
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

An access point has a flowring per destination: one for each station
and one for its broadcast and multicast frames. The ring of a station is
deleted when the station leaves, by brcmf_proto_delete_peer() with its
address, but nothing deletes the broadcast ring, nor any ring of an AP
that stops: brcmf_cfg80211_stop_ap() deletes none, and on the link-down
event of an AP delete_peer gets the address of the event, which names no
station. A new start of the same interface then keeps the old rings.

Seen with a BCM43684 whose AP OpenWrt starts twice at boot, 1.2 s apart:
the firmware never read again the broadcast ring opened as the first
start ended. ARP and every other broadcast of that BSS were lost, and
once the ring was full flow control stopped the interface for all of
its stations, until the ring was deleted hours later by a change of the
interface type; the firmware then served new rings normally. The vendor
driver deletes all the rings of an interface on a link-down event.

Do the same, and when the AP stops: brcmf_flowring_delete_peer() without
a peer now deletes every ring of the interface.

Fixes: 9a1bb60250d2 ("brcmfmac: Adding msgbuf protocol.")
Signed-off-by: Kordian Chmielewski (mlody1212) <kudzo51@gmail.com>
---
 .../broadcom/brcm80211/brcmfmac/cfg80211.c         | 14 +++++++++++++-
 .../broadcom/brcm80211/brcmfmac/flowring.c         |  5 +++--
 2 files changed, 16 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c
index b0eaf9641..91184bdcf 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c
@@ -5480,6 +5480,11 @@ static int brcmf_cfg80211_stop_ap(struct wiphy *wiphy, struct net_device *ndev,
 		/* first to make sure they get processed by fw. */
 		msleep(400);
 
+		/* the BSS goes away and its rings with it: nothing else
+		 * deletes the one for broadcast and multicast frames
+		 */
+		brcmf_proto_delete_peer(ifp->drvr, ifp->ifidx, NULL);
+
 		if (profile->use_fwauth != BIT(BRCMF_PROFILE_FWAUTH_NONE)) {
 			struct cfg80211_crypto_settings crypto = {};
 
@@ -6750,7 +6755,14 @@ brcmf_notify_connect_status(struct brcmf_if *ifp,
 	    (e->event_code == BRCMF_E_DEAUTH_IND) ||
 	    (e->event_code == BRCMF_E_DISASSOC_IND) ||
 	    ((e->event_code == BRCMF_E_LINK) && (!e->flags))) {
-		brcmf_proto_delete_peer(ifp->drvr, ifp->ifidx, (u8 *)e->addr);
+		/* the address of a link event of an AP names no station:
+		 * the BSS is down, and so are all of its rings
+		 */
+		if (e->event_code == BRCMF_E_LINK && brcmf_is_apmode(ifp->vif))
+			brcmf_proto_delete_peer(ifp->drvr, ifp->ifidx, NULL);
+		else
+			brcmf_proto_delete_peer(ifp->drvr, ifp->ifidx,
+						(u8 *)e->addr);
 	}
 
 	if (brcmf_is_apmode(ifp->vif)) {
diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/flowring.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/flowring.c
index 35cbcea0a..b9570d638 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/flowring.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/flowring.c
@@ -432,9 +432,10 @@ void brcmf_flowring_delete_peer(struct brcmf_flowring *flow, int ifidx,
 	u16 flowid;
 	bool sta;
 
-	sta = (flow->addr_mode[ifidx] == ADDR_INDIRECT);
+	/* without a peer: every ring of the interface */
+	sta = (flow->addr_mode[ifidx] == ADDR_INDIRECT) || !peer;
 
-	search = flow->tdls_entry;
+	search = peer ? flow->tdls_entry : NULL;
 	prev = NULL;
 	while (search) {
 		if (memcmp(search->mac, peer, ETH_ALEN) == 0) {
-- 
2.56.0

