Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795881819;
	b=WM8XwKaKTiG/pRtb3eTYLQOekwQmiDqtz69mY1ULhPlYZkVpmQL/iuDNGOVVd6ObicYz
	 OqC83eFO2x7LB6p3ojNQDpTT1rC81HcJO4F9AxcZzIpC8mC2gKdoK7ThSe2voHizgXerL
	 Y20lb3+SlFJL5wUs7zlcaI1F0SymVVp1CWJqeqnnIEemybFHskz9MHRq7DhpoyLP1OyO/
	 vRU6vUEH7n6VuNpi6L1pmkcILlzO6n6wRwHgWart0aRPZp6DKgPgbo2f68sl8ho6qz8or
	 tuuej6IrbeAd7LqxFnBPDY5pvbOmQ0II7kiJAuaxyzxniclmFicIVGJHjIXCR28VP7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795881819;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=WDnHtIqvlcKh+KT2fInLEGWX50aw9RAoLdBVSUbUWiE=;
	b=muFAHxNg+Lq9d7zF6UxZ1UoN2sdg8xKZIGXP0S+hUzYCSc41cDvBx1niLwUTJ8a+x+x9
	 OrFwLl7AM2XyFUYLiH2A9kAIHfunkSsFQiV9+AvmYfSruDmrgluAQxKZokQk2Bj3i0pT2
	 bi+IjPCgAl2a5+NVBYuoVESPCsXMAczwgeSya6o7I7/b/xCyBixVeqZbI91i0lVTO2VnS
	 rkdf7SiTtCKs6ddeLRrhjpQofNMGFY/igN0Bc1txjTLZ6Cx1rduq9NzCg3pLp4b3gpAjQ
	 GglQR8vJI46u81B7njjXR53a8KpDdTef5zwo8gYphGIoklzfX9t0/o+gHWkr8i55lJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=F3Jmn6+I;
	arc=none smtp.remote-ip=209.85.218.41
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0999606A6BE
	for <linux-wireless@vger.kernel.org>; Sat, 28 Nov 2026 16:03:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B0999606A6BE
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=F3Jmn6+I
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c5118deebcfso1351418666b.1
        for <linux-wireless@vger.kernel.org>; Sat, 28 Nov 2026 08:03:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795881817; x=1796486617; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WDnHtIqvlcKh+KT2fInLEGWX50aw9RAoLdBVSUbUWiE=;
        b=F3Jmn6+IP84x1zhxgZogKB5f7so+jHX2SIy/B6Z5JuVC3jgHuUFgoxceGJF72dH3fY
         QblGIBbfQkfU8iSleTivQGsJ+wkRxXGGn9P1LpZYQ7/IQ3uDqZbncApBJUskHg6kQvm1
         8lbCP0gna1W2Gg7NM0CT4Puigm3zfT9g6hmou8IdvtTJ6n1vwacXvYGWAIuhoTCrCvMU
         Afoeq/pcQ5je87sKoLum7ndpII8qU3L6rDfncTwlVafmO1fUhFlq8U5YvS6Ea8I9amAa
         8Q6Ui+I3fwQE9VMyfiFFITEeagGOKHpXytMyLNyKJeSZcEKH9G4gHst5U3pqb4eHsx2C
         +cOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795881817; x=1796486617;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WDnHtIqvlcKh+KT2fInLEGWX50aw9RAoLdBVSUbUWiE=;
        b=ZoAMTeq2C6HjMEFAyy9xN2Adf7Aq9qEjpglQ/waLYzW9hCPA3JJMnvSWm80h9baGOv
         W4kAbRkqJbw+t0ENqxSjWABTUIN63DfJvB0Zwle+Vs8P6nctPL+oZCoK0q5OcsAIRCst
         lqTLgeZW3bNQDSEZEX+QVz4EUbdf6JtaVRU1B5JA53eiVfM1d2GywIMAVUYIylN538NF
         nGnwcrUOMhBIKPH6BUm7bt2zMPF6AMYV0npVuFHXeJDI2mwrDZtizWNXPIVOWz0Zi+lq
         nWeM70gjeorIR4r+i/vWROtqHhGuh02ViIwr36k/Oy5vlxN1ksLCELJAtsmJ/dVbswKk
         TlZg==
X-Gm-Message-State: APuU4Z8U0rVs6b/fjOongNnTr+kIL/bOo7Sl9F82fM1vCzqAAjbK8i8p
	DaNeyCd591LS0rSeYKx36bNhXjJ7GlOpoNv+D9D6uzkPfXpcChvScPSTG3s1BHbUzg==
X-Gm-Gg: AZFdTZcY48NPM+79vj5FtznAodlxJ3t/ULSo7QSfnFKJHdgV7hu5yG6xYW2NKGIhB99
	3nv2f3qBWkBFhz2KQw93PL/YwF6b+YhnjoOFqB9tLOR3BX+sKHTxf0DWNQsQzAyFD/vfV7lq9wi
	Pa2EbbVziFsqjdNnJHwXcXwjggiA/hINLZ3AVvc+0hSMOvQwZRZXst6ojOmN4wNJD1VDj/5Aldj
	CggnDNx2Jyyzl6B6OHqiFzwEOitlloH6sykbJ2jN2qG/n7UbkHGOsbCx/P9GBTn1AqmGJwQfCOF
	acKCyKfPG0ctq1hy6mBcv4tYpM2FiUjJj/xDp1SZm25wenJc1xBYbwt8nobh3RIUKFXTS2cclem
	nhRiZ/7sSbbJY8C0IMB9QrF+W9VTwcwNgaDT2y14251wqsbKbmt0GxBDSUJ64HFkT0lqEwGB4UP
	Is9DKGrJWeRkqXhedaH0rCkmmC9bEftQs2GVkX9RjrOaQGP1rmfILNu6wl/QcLV83ymipoOcfyd
	Pr3+WpHgm6Pk8UJ+aUvj3NzJB/9lgiV6knA6gYM+QLJw+x2ALOcvLg290dVFvESIOY3uux9tX1v
	mk9JUdc70Dou4UcsJZT09GWRytx70dFctvdQKb+ct0j0q3n+devwdeijmYlSUkbbPtLIScpzkkA
	i2Xw09g8HEQ7zUXugs+3UNZ53EqpmvDbUpvA6G9klHVUu8mzZw/PBI/wNtNTSDbr3dYbVWfYphg
	P6EpygCYLaRrY8GTyJExLeEhJWAiDd7c0UXt/GEtRu7zQA1hMOaKElMX9WPQKJT1QJMKutF6loz
	DdFkEOdth+0UQ57Mknuh5pdsixk+Qa4qfMn/vcODl4DYSolKKpq2jNob5IV0eNZ449+BQOwzxW5
	wVL5PM9y418AaUw=
X-Received: by 2002:a17:906:1255:b0:c2e:378c:8ceb with SMTP id a640c23a62f3a-c513ab2f292mr1758991266b.36.1795881817055;
        Sat, 28 Nov 2026 08:03:37 -0800 (PST)
Received: from Desktop.tail070c67.ts.net ([185.152.145.248])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513b022e84sm990389566b.84.2026.11.28.08.03.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 08:03:36 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org,
	Jeff Johnson <jjohnson@kernel.org>,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	Felix Fietkau <nbd@nbd.name>,
	=?UTF-8?q?Toke=20H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>,
	=?UTF-8?q?Toke=20H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>,
	ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH wireless-next v2 5/7] wifi: mac80211: take the TID of an 802.3 frame from the driver
Date: Sat, 28 Nov 2026 17:03:33 +0100
Message-ID: <20261128160335.1815537-6-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261128160335.1815537-1-julius@bairaktaris.de>
References: <20261128160335.1815537-1-julius@bairaktaris.de>
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
v2:
- No change.

 include/net/mac80211.h | 4 ++++
 net/mac80211/rx.c      | 3 +++
 2 files changed, 7 insertions(+)

diff --git a/include/net/mac80211.h b/include/net/mac80211.h
index 58a0a387d86c..0d0aa613c280 100644
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

