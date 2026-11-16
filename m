Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794871151;
	b=Z7/catN4pycdXHm+dVsoOpIrxUkXrpwgsA3zW5JZFWVfaPFi7S7Pv+poAUI5ZVWJJ+Ax
	 /+9vY+IxLWm78lCLVbVWbEwSRjEfIu+JJ/65hhNL8e53cVU1p73bwkoY1OIzAXfvMpNis
	 PK/vOoDzckCFv5s5QDaKI0u1omzJ3noY8oLE8tscknJVEwGUDRwFpMFtW9s0YzmVqKJm1
	 QYSARZ2QmvC7Ysi1mNftfeWxwtZ/lXG6klrYYrAkptIzGQamsPjfCVkHegT5AaSZcMfYg
	 huHJ5gXSfHDgDEr2Sj42sSGhYLfX/2b1Pqp3o187ODRWpQqbnL5cAVbpDV97F1g5+kg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794871151;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=aqPXottFYOutXOMQvzlLK+26GjfsJhTTj7QpTc22c+E=;
	b=MR3aBjZ20VX70j84I/hCytPxC7KIaH4dVscFjLPbDuQNPT1kfkC5eL71vTCLVz86pmUU
	 w6Rya2s9hk7RK3/iZ6EVwKWsfk4t+GjRlshgmKqTLzsc4uHoHVCQRcLmUREzhJ93Io4tn
	 L2GlCf0abJCvij7qU3eUP+GX0R0hPEzf/1kzgPZgmuP3Ec4noeUy0lnwK1vJ5OIndHY0F
	 LydsR9k8RbOGKlz74KZd0DIq+S2TaO7qxDmKyAj1ScXT/N7tMmfTUGh9VcaTnam16RxOq
	 +71fYjG/y78J5z72ljumYCgVEHq87RWXIbk1p5bNCV7PON8RXIBJOsBJlblvEua6OMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=kernel.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.160.47
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFE3B606A31C
	for <linux-wireless@vger.kernel.org>; Mon, 16 Nov 2026 23:19:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CFE3B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-4a76f63b243so271094fac.0
        for <linux-wireless@vger.kernel.org>; Mon, 16 Nov 2026 15:19:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794871150; x=1795475950;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aqPXottFYOutXOMQvzlLK+26GjfsJhTTj7QpTc22c+E=;
        b=ygfvfMrDvhGZKW+BeLOtrOGCby35Wsb6pb/DTEHol7Arr7dlIfhT9LhBUBtOE8LAEr
         nInbMBCd9m6TKRqAG2E9W7M3B0kK98aBkg+AWqOP+1hSqd2GChde3l5tPTHXC0NZSWN9
         PBG8TXdh8LevP0rCzeAyHElChrMU+YSciJ1lMPEU4l1qicQg9a2GxmHxiFP0jS4nwK4C
         7PfFUGjPq1233OmLx7w9bVtldBrbyTBSlfNPkwLVfRCT1VD3/xtArypS8gnXsbjBhQoQ
         TiK1glTNlQBgvwGoC3Ah5jHlX7t5Qjacexu/lOwONGhWVBJyCuz7FUjmWF+xVRXVWm4C
         uAnQ==
X-Forwarded-Encrypted: i=1; AL+hErHcLa+Zy6LBDVkehYaiqIvSgf1G0BzYgkDzL7xMhzrM7DigpzjiDTjanCDGpcgjZX0XbM3TiywsbkK7kFkB5w==@vger.kernel.org
X-Gm-Message-State: APuU4Z/i5Df9eldeSDeL/0FPlC1Y0PqBN3cU5iTmNHgkg9w/zaAC/wEO
	hc02zTGzJhc6AWOY/nE3ymLXfJAvfbneCVh3Yhge3cllSbzM4MzmYaE+kbHbDQ==
X-Gm-Gg: AYBFou0Tf0/ZORhNrEEm8+LbFmtWfzYh+23g4XWi7SHmVFYlmoHKXaBNYQRuKDKIa4y
	K6inOqP42211VQ19jvofMiGEeg4SPbUJ0nScbqvT396ZrHEywTfjLrcurmed4oEBdjHW5GtJ0Rk
	R0OHzkfUHtPbfi4n1w0A+lbZxlx56MiVvIeMqMrHJAwDeaY9WoVPolMf0jhXZEa4xG2Mn/imaxv
	ObXSvvx7Z3cwizuLZrrIWVtoihzoxXMR8cNbw7faY+9kfTvgWBIqRByKnv8BAAWUBy6GOVPXPOf
	jzN6RrXsUa2gO1HH8K7b9lzNvqBf/hAjChb1jOoKSKJaWQAinIiqPNQrwlVh7L6UdaNXyftisSm
	+Oy/xn+7W2yu1HcgE218rZszVLpctv+aBPpcdFB8DsyU71tKBd9r16IHePBCFaPvg+Qyc8oaLr3
	/YkcMDqrVf9Btz7F3nYebo6nfuii9K4vlbZfGvNduwkO6Zya3UWKBLxe+F4Cdr7qurzBgfyonie
	TVglKz9sWIfmR3rhxLuDk/IhK3BxtuNPocQ1HRn0c0/roL3muDSZ8YwKxU9e6DPxQaftM5u77WI
	qcP6WS8tg73+cPYoNaOPQ9VK850u+oYqp8tokf9ZEokK8xqxeKcM3jKCskiVyFNuyyELptDMMeF
	B4vNRXie6
X-Received: by 2002:a05:6808:2207:b0:564:3fe1:2f9a with SMTP id 5614622812f47-575dbb40c30mr615685b6e.17.1794871149690;
        Mon, 16 Nov 2026 15:19:09 -0800 (PST)
Received: from sean-HP-EliteBook-830-G6.lan ([207.191.35.252])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56e70c58f9bsm10239635b6e.13.2026.11.16.15.19.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 15:19:07 -0800 (PST)
From: Sean Wang <sean.wang@kernel.org>
To: nbd@nbd.name,
	lorenzo.bianconi@kernel.org
Cc: yu-ching.liu@mediatek.com,
	chengwei.yu@mediatek.com,
	jacobs.wu@mediatek.com,
	posh.sun@mediatek.com,
	clifford.hsu@mediatek.com,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Sean Wang <sean.wang@mediatek.com>
Subject: [PATCH v2 08/19] wifi: mt76: mt7925: do not deactivate shared NAN BSS on peer STA removal
Date: Mon, 16 Nov 2026 17:16:19 -0600
Message-ID: <20261116231630.1733906-9-sean.wang@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261116231630.1733906-1-sean.wang@kernel.org>
References: <20261116231630.1733906-1-sean.wang@kernel.org>
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

From: Jacobs Wu <jacobs.wu@mediatek.com>

mt7925_mac_sta_remove_links() sent BSS_INFO(active=0) for every vif type
except AP when a peer STA was removed. NAN (nan0) and NAN_DATA (ndi0)
BSSes host multiple peer STAs like an AP does: removing the NMI peer on
NDP teardown deactivated the shared NAN sync BSS in FW, after which FW
dropped every host-initiated NAN mgmt frame (TXM: An MMPDU for an
inactive BSS_INFO) until the next NAN_START. With partial availability
bitmaps this made every NDP re-establishment after a teardown fail
(unicast NAF TXCNT 15/15 no-ack); full bitmaps masked the bug. It also
tears down the shared data BSS while other NDPs on the same NDI live.

Exclude NAN and NAN_DATA vifs like AP.

Verified on 187/235: teardown no longer emits the BSS disable cmd, the
FW drop flood is gone, and half-bitmap re-establishment after
nan_ndp_terminate succeeds repeatedly (was 100% fail).

Co-developed-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Jacobs Wu <jacobs.wu@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7925/main.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index 2ff58b0742b1..109ad137c8f3 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -1524,7 +1524,16 @@ mt7925_mac_sta_remove_links(struct mt792x_dev *dev, struct ieee80211_vif *vif,
 		struct mt792x_bss_conf *mconf;
 		struct mt792x_link_sta *mlink;
 
-		if (vif->type == NL80211_IFTYPE_AP)
+		/* AP, NAN, and NAN_DATA BSSes host multiple peer STAs; removing
+		 * one peer must not deactivate the shared BSS. For NAN, doing
+		 * so would kill the sync BSS and the firmware would drop all
+		 * subsequent host-originated NAN management frames. For
+		 * NAN_DATA, it would tear down all other NDPs sharing the same
+		 * NDI.
+		 */
+		if (vif->type == NL80211_IFTYPE_AP ||
+		    vif->type == NL80211_IFTYPE_NAN ||
+		    vif->type == NL80211_IFTYPE_NAN_DATA)
 			break;
 
 		if (vif->type == NL80211_IFTYPE_STATION && sta->tdls)
-- 
2.43.0

