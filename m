Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795354951;
	b=2Co6W1M0EGhzSp4gCLrYgFZCfvKLALoW/ybbFajrVP0LI4Z4EPuD5dCryX1VDXrauvxX
	 6Ck80cG7EId4eUSnuzGCbDG8g2wy5lXU40r10Yl5b91rVQ+1RI/kMlY7C5idtG4y0AU+Q
	 jHiZ5Og1BwwTqe1lutrPSXZJHjp9bj5z7vLpJ1a/m992NGU+3e4u8Nj/YQKtmxWU5Oi56
	 8dLsPBKw1aybiSsSQUhdESYUYGRpJedouY+iPK0L+oE5dzf+KFYe7YYRkafWLonX7yf2l
	 aVnPaF5TmyIE84rIzbC2tfQKLx5WdW5kIzMoGNjanPcsrXiNMvto31BpOTZy+CoL4yw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795354951;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=nfBVe7oeliVCYRMEEI0YTZZ5kge0cS6jQivTz9dt6BY=;
	b=eM+HjS2q0esaIJsxUdlg+T4rXu8R7YgHjmg0o/0u8xvw0Cuol7ya3kb+6xk3FXo6VSoI
	 9fYtSsa8O6SSbWC/VZKdulschFq4b73tjyUW2cejCbOu1NZjhNgdXT1jCFI4imEEfuHe9
	 MPkFGYZz0NOb6pCnDn+svXj6fILaxZPkUOwblytHTqowPCSCdjrgHV7Ih5oyOJAn2zoDb
	 7Lhz+QPlaIcbxcd62+p4opTRBn2YwsEZu05lJP4PBgOYueF92Z8S6iDYanHdxXSAu8IZ5
	 k0fOhbRMW312WscQInYMnFvI4LamM97KNcCqvNPoxraxk+KnZMQ3BhShoMkBf6+/IJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b="p/b++qCi";
	arc=none smtp.remote-ip=209.85.218.49
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27039606A684
	for <linux-wireless@vger.kernel.org>; Sun, 22 Nov 2026 13:42:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 27039606A684
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=p/b++qCi
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c516a194350so57819166b.3
        for <linux-wireless@vger.kernel.org>; Sun, 22 Nov 2026 05:42:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795354949; x=1795959749; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nfBVe7oeliVCYRMEEI0YTZZ5kge0cS6jQivTz9dt6BY=;
        b=p/b++qCi0Doz41tIuveRiF91Kc9PFXgN+6ZOtxLSuSEA/7aDo7NLSFZtHVFtEMi96M
         jsbUv92aBIGMQuj3VJJJr5yPizDLEmerUmPXQDZirAMKoDISumIQ2hr55cv+RZNxGuUI
         wI+2L1enKdlXu8N8nSQwzWrbK51ljJ4Hg73v1LZ1Fp2aJYIDLPTvkS7tJDlx3yz1ydP7
         sEzZ8gmuwuG0yJQeXHomPumRM7xm/SI3lbJwg63HHmXSvsYLYRfTywV9ZR3o+DVtohQM
         F1kRL5FJFWet41t44QaJ8AatZl/rRWTbVkOXSMV94bcuNlLKx3U5n2wTHc7W3cLNTG2f
         UY9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795354949; x=1795959749;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nfBVe7oeliVCYRMEEI0YTZZ5kge0cS6jQivTz9dt6BY=;
        b=B/Sj6DwFM8T8Mt5d/U4pqbB5hlqHEtw4I5OsIYkX9FBW16IKEwyld2N24C9/a6vY8W
         JAe+JvUNUuKmhIF5j14DeSvgwgxE3hZ3gDSO784GQUVCIlZSFn1NGds/31gDtnXL2np+
         whOPVs7TwPzWux3h69v44TzN2ZfGM+uG1XWRQ+raSDRDzRM+jfdizxslPW31QIHlGKMB
         PR59/aMYJFHMc2vGTnQ6izOnyy2tGq42vgeP6kP7CT2/Kwz996sWVPHUQ/56+6QztxRt
         e0uNo4NidOPq7zM6aj65oaYFB0Rae3u+ZP8vDk0XnMACCbJX79inK7sJVAqY7qxh8XAn
         uDuQ==
X-Gm-Message-State: APuU4Z+pj0PhwiFUQadAasTUBNjGPJSKgbc7Olp4eCDe5hYK/pLcUWg+
	mT4gMdHqO1RNKEN+wWgw3YiH+vQnampjFzlh3sP7jxwwP38b29SNdu77h2J/br0wBA==
X-Gm-Gg: AZFdTZcsr5k3Z3W2DSQpKryXPxpvvJD0+jcQqa2fleplOApoZMhVEpAjnLXfIZd6leY
	Yi/n65DFUWpDO6IUuksEuSxiqd3Tf8dt4Rp05prgQpJptkn2sBGJ/oJB6leIvtc9OmsXAPOqIkS
	LbohfD6ZyyBtOM4jGurulaqr4oBm5rRu2fy5peJROvGmosc4EHhGbMaW/vvcQuoUmgvJIEOWJIx
	+SmuaRNVnKebbtBC85DVQTdUuj/gJsOS0x909EIbemJIShNB1REoe0uRUW7VKeKecJFSzuU0NmJ
	yue7Qej6uPqIxXIMdASCjjYozQgYk5G6/8xdB4MYtEV4Igdg8wy9S6HMPNx64VIw0clth/IiVtU
	ClnIA1aJpIFDbRkMLxLEaX4CRIyyXx/aUDZoBzqI7QZL1vr+p4byjzRNhguAYSOIC3I9+PYf6nK
	pSmgjsgdvmeBJy+I5iJ3XW3W8ZtrKwAj4Nmlpdc/ZfG1FH20Xc4xHBFy6t1fGAJr36uGQnXf6Ny
	DqKbSYGymxMliyVj+PtXblhaiqHVPRR72DXgoxMojhtF6ZOpipn11AKI7bWPSCHpgFaLlTIkimT
	6CtpXiDKv36tfZjcYCy3W45SpGn85ewmIUh5FP5w3GV93Bc/FKo8ev1J/ZChp8JMhDqrMrmh9Oo
	FN24KZN3lG8lqh+AK5ulhPuD187wWzoMDnrgtzSLPctPIfWSvv+zH7IPwjErxW6Z1dGWmC8JT1Z
	T8UovM5Sm9NNKnRrF7GPv37/X/WQUvBSGLJTAPuwBwE2qi31igJ/rTHiBcMQ9bZPcsGL2TQFh8n
	SeuN9a87+Z88aN5WpYWYoU+hjwubdQT/wOLwRtH5I8ZtFjMnCTpY7F6/pxXb+5jsZ+ZrE+cd8B+
	IrwKyw43MDtF++VCYX3IC4dLzNyd21HBDhOd8CuRwL8bGrxILN7uo5Y=
X-Received: by 2002:a17:907:2d13:b0:c50:ca93:19a0 with SMTP id a640c23a62f3a-c513aab9bcemr746699366b.40.1795354949578;
        Sun, 22 Nov 2026 05:42:29 -0800 (PST)
Received: from Desktop.tail070c67.ts.net (p200300f24712e3000000000000000a27.dip0.t-ipconnect.de. [2003:f2:4712:e300::a27])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ad010bcsm326020566b.1.2026.11.22.05.42.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 05:42:29 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org,
	Jeff Johnson <jjohnson@kernel.org>,
	Felix Fietkau <nbd@nbd.name>,
	=?UTF-8?q?Toke=20H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>,
	ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH wireless-next 2/4] wifi: mac80211: take the TID of an 802.3 frame from the driver
Date: Sun, 22 Nov 2026 14:42:26 +0100
Message-ID: <20261122134228.956044-3-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261122134228.956044-1-julius@bairaktaris.de>
References: <20261122134228.956044-1-julius@bairaktaris.de>
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

__ieee80211_rx_handle_8023() clears struct ieee80211_rx_data and never
sets seqno_idx, so ieee80211_rx_8023() counts every frame received with
RX_FLAG_8023 in rx_stats.msdu[0], whatever its TID. The native path
takes the TID from the QoS header, which an 802.3 frame no longer has.

Add a tid field to struct ieee80211_rx_status for the driver to fill,
and use it as seqno_idx on the 802.3 path. A driver that does not set it
leaves it 0, which counts the frame on TID 0 as before.

Fixes: 80a915ec4427 ("mac80211: add rx decapsulation offload support")
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 include/net/mac80211.h | 4 ++++
 net/mac80211/rx.c      | 3 +++
 2 files changed, 7 insertions(+)

diff --git a/include/net/mac80211.h b/include/net/mac80211.h
index 8eac4d50d06c..d601070810fb 100644
--- a/include/net/mac80211.h
+++ b/include/net/mac80211.h
@@ -1770,6 +1770,9 @@ enum mac80211_rx_encoding {
  * @ampdu_reference: A-MPDU reference number, must be a different value for
  *	each A-MPDU but the same for each subframe within one A-MPDU
  * @zero_length_psdu_type: radiotap type of the 0-length PSDU
+ * @tid: the TID of a frame received in 802.3 format (%RX_FLAG_8023), or
+ *	%IEEE80211_NUM_TIDS if it has none; counts the frame in the per-TID
+ *	statistics of its station. Not read for other frames.
  * @link_id: id of the link used to receive the packet. Set and used by
  *	mac80211 internally, it uses @freq set by the driver to identify the
  *	correct link per vif. Set to %IEEE80211_LINK_UNSPECIFIED for non-MLD
@@ -1813,6 +1816,7 @@ struct ieee80211_rx_status {
 	u8 chains;
 	s8 chain_signal[IEEE80211_MAX_CHAINS];
 	u8 zero_length_psdu_type;
+	u8 tid;
 	u8 link_id:4;
 };
 
diff --git a/net/mac80211/rx.c b/net/mac80211/rx.c
index a2356cd17691..9fabc9b5a976 100644
--- a/net/mac80211/rx.c
+++ b/net/mac80211/rx.c
@@ -5303,6 +5303,7 @@ static void __ieee80211_rx_handle_8023(struct ieee80211_hw *hw,
 				       struct sk_buff *skb,
 				       struct list_head *list)
 {
+	struct ieee80211_rx_status *status = IEEE80211_SKB_RXCB(skb);
 	struct ieee80211_local *local = hw_to_local(hw);
 	struct ieee80211_fast_rx *fast_rx;
 	struct ieee80211_rx_data rx;
@@ -5313,6 +5314,8 @@ static void __ieee80211_rx_handle_8023(struct ieee80211_hw *hw,
 	rx.skb = skb;
 	rx.local = local;
 	rx.list = list;
+	/* the MSDU count of the station is kept per TID */
+	rx.seqno_idx = min_t(u8, status->tid, IEEE80211_NUM_TIDS);
 
 	I802_DEBUG_INC(local->dot11ReceivedFragmentCount);
 
-- 
2.53.0

