Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.4.11.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795441766;
	b=EDoFeVtSf6AXYNs6ZnZEUvG6aDZn3gKxsqsPc0U0aeII3M3E0Lnf98fm4OGjKU8Gjg6M
	 V/1FzfV3qyM28swLvhGrOVElQ6VXc7Ea+ydbDhv0o0itYfwswxdNjliY3FPmNr9SLEOpT
	 A1lLDWdQQHobl/GeQlcPLglgfnKA4I5N1BjGSxTy43fR9x7n20nSRmq6qscdo0xRqsxAl
	 ZEgAqOm7Zb00VVRlB0pPZ07JTdyHOPJgkmsRC0mk5ypKBZQAERAfUaXeHJ18aalx2+9DS
	 DvIlCzA9SFBglIKCSHSgnSbGaHyL+KE3Roqy9G3Ftdxie4fY34y/o0SIj7/yGwp+Vqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795441766;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=nOacRoNyyvkmPhUr2DeDoFHUDdEjdRaEaAKsQyyp72o=;
	b=wsnQWINXrCV5T9iMthYCh5qF+g5AQTzwUU5f7fVzUeO8coLTX1O9bHe0LZrPzemnFEqG
	 fmy7i2fPt5gxgXTHawiCuDY3Dv1Jy+OioRt7xTQvgzVyD5mxXh95j1xt+5j+r3RlwIIiL
	 CQdo/3e7taSEeAthCmSC3Af4hy9Tv38pJgh8yeqWfxJnJGhc1h2JOxAuoFVsuxcBJ89Dd
	 G0y7gCyKn5dPGyh7ySeW/k3x+9UFKUiuJWPOLu2jxT/eGBYak5mmhC5UeJpOdRHqu9MZu
	 vvvFBjSVADBQ9OGlOBSBIUeMnD3apC0L3qRRDL8uPB2W2ldbbMMxI1w+EVrNuz4GrjA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nbd.name;
	spf=pass smtp.mailfrom=nbd.name;
	dkim=pass header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=uRcXHLuJ;
	arc=none smtp.remote-ip=46.4.11.11
Received: from nbd.name (nbd.name [46.4.11.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0C90606A697
	for <linux-wireless@vger.kernel.org>; Mon, 23 Nov 2026 13:49:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E0C90606A697
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nbd.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nbd.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nbd.name header.i=@nbd.name header.a=rsa-sha256 header.s=20160729 header.b=uRcXHLuJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=nOacRoNyyvkmPhUr2DeDoFHUDdEjdRaEaAKsQyyp72o=; b=uRcXHLuJktuN2gietgAjNFhLYJ
	ofqlpRDzOHVeh+UmjIra5VLKe7LF2n2WB7SzGYlIN5oz60O1W2C7nJn9C3mks7OOaqFdDb6wjxCKG
	iqFvuGsKbf26cKxaAHZgDWH5ucKjQcLP/87oVvCsTNU9swzgMhLs0lzkwx6dPvtHC4GU=;
Received: from p200300cadf1ed20000000000000005bb.dip0.t-ipconnect.de ([2003:ca:df1e:d200::5bb] helo=localhost.localdomain)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <nbd@nbd.name>)
	id 1xVUQ8-007NFk-1p
	for linux-wireless@vger.kernel.org;
	Mon, 23 Nov 2026 14:49:24 +0100
From: Felix Fietkau <nbd@nbd.name>
To: linux-wireless@vger.kernel.org
Subject: [PATCH mt76-next 17/20] wifi: mt76: mt7915: divide by the full TWT wake interval
Date: Mon, 23 Nov 2026 14:49:16 +0100
Message-ID: <20261123134920.154270-17-nbd@nbd.name>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261123134920.154270-1-nbd@nbd.name>
References: <20261123134920.154270-1-nbd@nbd.name>
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

mt7915_mac_add_twt_setup() passes the 64-bit wake interval of a TWT
request as the 32-bit divisor of div_u64_rem(). An interval that is a
multiple of 2^32 us thus gives a division by zero, which traps on x86
with the driver mutex held.

Any device in range can trigger this with one TWT Setup frame. The frame
is not robust, so it is accepted with the address of any associated
station. Neither mac80211 nor mt7915_mac_check_twt_req() bounds the
exponent or the mantissa.

Divide by the full interval with div64_u64_rem().

Fixes: 3782b69d03e7 ("mt76: mt7915: introduce mt7915_mac_add_twt_setup routine")
Signed-off-by: Felix Fietkau <nbd@nbd.name>
---
 drivers/net/wireless/mediatek/mt76/mt7915/mac.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mac.c b/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
index b7f86195af2d..d444073af4ea 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
@@ -2380,13 +2380,12 @@ void mt7915_mac_add_twt_setup(struct ieee80211_hw *hw,
 	if (sta_setup_cmd == TWT_SETUP_CMD_REQUEST ||
 	    sta_setup_cmd == TWT_SETUP_CMD_SUGGEST) {
 		u64 interval = (u64)le16_to_cpu(twt_agrt->mantissa) << exp;
-		u64 flow_tsf, curr_tsf;
-		u32 rem;
+		u64 flow_tsf, curr_tsf, rem;
 
 		flow->sched = true;
 		flow->start_tsf = mt7915_mac_twt_sched_list_add(dev, flow);
 		curr_tsf = __mt7915_get_tsf(hw, msta->vif);
-		div_u64_rem(curr_tsf - flow->start_tsf, interval, &rem);
+		div64_u64_rem(curr_tsf - flow->start_tsf, interval, &rem);
 		flow_tsf = curr_tsf + interval - rem;
 		twt_agrt->twt = cpu_to_le64(flow_tsf);
 	} else {
-- 
2.47.3

