Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794769132;
	b=zdG8hP2kN8o2/Yz5wZy9DUS9Wgw/W5dORdWEPcbCaUxtty1bHiVVADr95ykvo5d4NjBq
	 9/X6YXOxjzB2D74l39gj0xASWz8NFq4Hem4E4SAor5lVUwFxIjuUXG1cLYmvc0D4Wg/H+
	 gNfK/v25adsbS+Ty9JXvttWSyUeiwpgB/eQD+0XTn1KxpUhN0MB7CVgesIPd3qSbjV/D6
	 Xf4CfLfp3xh5jMkLhKX/5AWI0GP55M81UkUimakmXtQ+7b7ieGp/BC/Nsrf6HyKM5Vv4m
	 DBcd/UZIv4LVUP+nq7eK4s0gjsI/KZBik7J45UPp/gk6cLAZlOEly8GwNCh2uypQ5zg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794769132;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=EnS/ri7nlGvZvOeUzY5N/14h/E/bZuutXbD3tTV/cpk=;
	b=G0oTYj0EDeVXZ2erqfI5vJZvSXGfoLU7jAMh0v02zQHFMXzl6LT3UU5nVMSCdN9eKwIo
	 Cq1LY6GzkVXxUsk083K8C0rxbkFJWQynZCtlbMjE8M/o26Su4eP1l2Uh3UyUVabRjTAk/
	 3VPqHpSokbuob0W0VeEMSUuQ9/KEMgWceWEgdqa7aUhN6ouGrrUiGXIUQMiJw9RhCvlhK
	 bVYiHD5ABlgB599IF1fUIcb0KmgYuxU7j3sG751kTRSZvXTg90AEsVCL1+WlcCkZ40TIh
	 /+BwQIsVC70atxLOSkYfCi0BhMqSNDBF7J9bue+12qsYhma9+bul9007Xyreoi/vgdg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nUVTrE+h;
	arc=none smtp.remote-ip=74.125.82.41
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 756FB606A882
	for <linux-wireless@vger.kernel.org>; Sun, 15 Nov 2026 18:58:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 756FB606A882
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nUVTrE+h
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-1aefd1bf74aso2028177c88.1
        for <linux-wireless@vger.kernel.org>; Sun, 15 Nov 2026 10:58:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794769132; x=1795373932; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EnS/ri7nlGvZvOeUzY5N/14h/E/bZuutXbD3tTV/cpk=;
        b=nUVTrE+h44fpfEqaLTkpMiSxzCY1ODqEjM4kazkgCVKQqyXisKUc6z8FX5n997A4e0
         tlYsMrauFcu0OaCdlAZCmOhTz9c70jQunJMFn1TLeFEy8ypOBzEFdmda4H2RN/pe4AXA
         Bq/mX42qQcbzwlZwpJYLLLJqA/Xv8Q78ae+E1rKe8EZm1916ysp+jNouDSfMAjxebEzN
         qtHElnaU54EEjMUh+Xne310qRFDXeptNmCHfDpdBSLJgVKZb1zJmRrtjUIUhx2tFygzU
         chnliIWwmAxz2f8DK1+dnq8TsxqdWhGXVtR9NYRzVv0Nvjrl6yosZFzY968aV87im+2t
         Onmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794769132; x=1795373932;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EnS/ri7nlGvZvOeUzY5N/14h/E/bZuutXbD3tTV/cpk=;
        b=QHJmbCYv52QIQXaUWuwVkKA+TT8IMQKXkfBELY1Ol+rbZYz9gNrv8oFyQ8ZXxnHxy4
         6Tzsq6AqFN4MKEnOwJRhJn2SJw4CRTT/kmP2iHvVizy+t0kROjYxe1HxP5eklZq1eHf0
         dcTOJfoEwMubN/qVpEhWnwj/aJMT4w20w4GFsoMcRzEamLnSkBbT+yoVcFXgIX/ltfNN
         eBk7IH6aJ1Zbr1PJYUbIcuGjgQeGf8Cqn7IqsJjIMIAzTo7zwt4Jb6mlnxVialFFVP6j
         o7GkKW3pNftJz68DS1k2Kbj7u46+y2S6o75pLE0DwCGFBNYKaX/yp654VFDG8rZ0Ujgf
         kcPQ==
X-Gm-Message-State: APuU4Z+tZrcHAz6CHza9+BxXqeLRy1w+oI8Kd6P1vBQ6v8lz87JrxCJO
	yk4pzA2GOVKc3/j+3LTwIP/6fQgz1/3aO7XR7cD4tXX+zzhp/0rZ6bF5
X-Gm-Gg: AYBFou2SM3T8l4JHJo4ydkrfhn8MrkldDvx6t1m98oMalzSLUMCN2Xo8Twr/GqwS/um
	0iGP7Pk6/iSm3BdeA2sxUGWwT0M/lLRZp0oV3bBTQp7iKIeRIZFr1N55/H5URXfkEKdcbyKI9mt
	dJ+C6HepiVD+J0oRIx4kOJZOA9S7oHUajF0C9eYUnC/4ogU5cue21dsTwfZG89nmgsSTkMzKC5E
	QX6C2XSCXK+znl1ddicD5rrxwSqpsAXyUMlhlbo/Dk+nXDOnjtOy6GLBn06dFm/hBDoANXSgf8w
	TqmdG5OQNGg9rEZfspSdEgaRhJP6p/uF3o70aD0sBGHw7bRGjUBGv0SN6DVpGeLZqc29H6AXrXy
	qiNqzdhRLy/1xbp9R5zmSFvCIZ3tZjl9Dp8X8gXcxlTfEL12a9KE2EGO8u1oBlsKwqzzVif9I6v
	AfHKSwo/8x0I3ltjVCleUYA2Cv6mBNzYueRK2LPOudaA24WDVWVhBcJaV+zdARxVmox2kFxZPCT
	zQWrlcmNl4ZsMRpv8zwzAeXbj0t7BiU9gO9jwvg2RBIJrjYd1f2tL6Irj9p7VyN07I4BX6conIE
	GCN+0So7CMqdIyAy2fWaCPWw53r+ZIvcYmd3w3cI0khUyI84So0Vtw==
X-Received: by 2002:a05:701a:8148:20b0:14b:1ef8:698d with SMTP id a92af1059eb24-1b5030ad3f8mr7907297c88.15.1794769131451;
        Sun, 15 Nov 2026 10:58:51 -0800 (PST)
Received: from csl-conti-dell7858.ntu.edu.sg ([155.69.195.57])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5329ec87bsm82306c88.0.2026.11.15.10.58.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 10:58:50 -0800 (PST)
From: Maoyi Xie <maoyixie.tju@gmail.com>
To: Arend van Spriel <arend.vanspriel@broadcom.com>
Cc: linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH wireless 1/2] wifi: brcmfmac: fwsignal: bound the AMPDU reorder indices
Date: Mon, 16 Nov 2026 02:58:42 +0800
Message-Id: <20261115185843.64633-2-maoyixie.tju@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261115185843.64633-1-maoyixie.tju@gmail.com>
References: <20261115185843.64633-1-maoyixie.tju@gmail.com>
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

brcmf_fws_rxreorder() allocates max_idx + 1 slots when a reorder flow
starts. It then uses the indices of each frame without a check.

	rfi->pktslots[rfi->cur_idx] = pkt;

A cur_idx above the allocated maximum makes the driver write and read
past pktslots[]. An exp_idx above max_idx makes
brcmf_rxreorder_get_skb_list() read past the array or loop forever.

Store the allocated maximum in the flow. Bound max_idx by it and the
other indices by max_idx. Deliver a frame that fails the check without
reordering.

This was found with a static analysis tool that we develop. A userspace
harness that compiles the fwsignal.c functions unchanged runs under
AddressSanitizer. It shows the out-of-bounds accesses and the endless
loop before this patch, but not after it. No hardware was available for
testing.

Fixes: 87edd8916ee2 ("brcmfmac: add AMPDU reordering functionality")
Cc: stable@vger.kernel.org
Signed-off-by: Maoyi Xie <maoyixie.tju@gmail.com>
---
 .../broadcom/brcm80211/brcmfmac/core.h        |  2 ++
 .../broadcom/brcm80211/brcmfmac/fwsignal.c    | 24 ++++++++++++++++---
 2 files changed, 23 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/core.h b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/core.h
index 399b6810e394de..19cecb987a87bc 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/core.h
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/core.h
@@ -52,6 +52,7 @@
  * @cur_idx: last AMPDU index from firmware.
  * @exp_idx: expected next AMPDU index.
  * @max_idx: maximum amount of packets per AMPDU.
+ * @alloc_max_idx: highest index of @pktslots, set when the flow is created.
  * @pend_pkts: number of packets currently in @pktslots.
  * @pktslots: array for ordering AMPDU packets.
  */
@@ -60,6 +61,7 @@ struct brcmf_ampdu_rx_reorder {
 	u8 cur_idx;
 	u8 exp_idx;
 	u8 max_idx;
+	u8 alloc_max_idx;
 	u8 pend_pkts;
 	struct sk_buff *pktslots[];
 };
diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/fwsignal.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/fwsignal.c
index a43f1a38b0e30e..e81105154d6543 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/fwsignal.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/fwsignal.c
@@ -1721,8 +1721,16 @@ void brcmf_fws_rxreorder(struct brcmf_if *ifp, struct sk_buff *pkt)
 
 		ifp->drvr->reorder_flows[flow_id] = rfi;
 		rfi->max_idx = max_idx;
+		rfi->alloc_max_idx = max_idx;
 	}
 	if (flags & BRCMF_RXREORDER_NEW_HOLE)  {
+		cur_idx = reorder_data[BRCMF_RXREORDER_CURIDX_OFFSET];
+		exp_idx = reorder_data[BRCMF_RXREORDER_EXPIDX_OFFSET];
+		max_idx = reorder_data[BRCMF_RXREORDER_MAXIDX_OFFSET];
+		if (max_idx > rfi->alloc_max_idx || cur_idx > max_idx ||
+		    exp_idx > max_idx)
+			goto bad_idx;
+
 		if (rfi->pend_pkts) {
 			brcmf_rxreorder_get_skb_list(rfi, rfi->exp_idx,
 						     rfi->exp_idx,
@@ -1731,9 +1739,9 @@ void brcmf_fws_rxreorder(struct brcmf_if *ifp, struct sk_buff *pkt)
 		} else {
 			__skb_queue_head_init(&reorder_list);
 		}
-		rfi->cur_idx = reorder_data[BRCMF_RXREORDER_CURIDX_OFFSET];
-		rfi->exp_idx = reorder_data[BRCMF_RXREORDER_EXPIDX_OFFSET];
-		rfi->max_idx = reorder_data[BRCMF_RXREORDER_MAXIDX_OFFSET];
+		rfi->cur_idx = cur_idx;
+		rfi->exp_idx = exp_idx;
+		rfi->max_idx = max_idx;
 		rfi->pktslots[rfi->cur_idx] = pkt;
 		rfi->pend_pkts++;
 		brcmf_dbg(DATA, "flow-%d: new hole %d (%d), pending %d\n",
@@ -1741,6 +1749,8 @@ void brcmf_fws_rxreorder(struct brcmf_if *ifp, struct sk_buff *pkt)
 	} else if (flags & BRCMF_RXREORDER_CURIDX_VALID) {
 		cur_idx = reorder_data[BRCMF_RXREORDER_CURIDX_OFFSET];
 		exp_idx = reorder_data[BRCMF_RXREORDER_EXPIDX_OFFSET];
+		if (cur_idx > rfi->max_idx || exp_idx > rfi->max_idx)
+			goto bad_idx;
 
 		if ((exp_idx == rfi->exp_idx) && (cur_idx != rfi->exp_idx)) {
 			/* still in the current hole */
@@ -1811,6 +1821,8 @@ void brcmf_fws_rxreorder(struct brcmf_if *ifp, struct sk_buff *pkt)
 	} else {
 		/* explicitly window move updating the expected index */
 		exp_idx = reorder_data[BRCMF_RXREORDER_EXPIDX_OFFSET];
+		if (exp_idx > rfi->max_idx)
+			goto bad_idx;
 
 		brcmf_dbg(DATA, "flow-%d (0x%x): change expected: %d -> %d\n",
 			  flow_id, flags, rfi->exp_idx, exp_idx);
@@ -1830,6 +1842,12 @@ void brcmf_fws_rxreorder(struct brcmf_if *ifp, struct sk_buff *pkt)
 		__skb_unlink(pkt, &reorder_list);
 		brcmf_netif_rx(ifp, pkt);
 	}
+	return;
+
+bad_idx:
+	bphy_err(drvr, "flow-%d: invalid reorder index, ignore this packet\n",
+		 flow_id);
+	brcmf_netif_rx(ifp, pkt);
 }
 
 void brcmf_fws_hdrpull(struct brcmf_if *ifp, s16 siglen, struct sk_buff *skb)
-- 
2.34.1

