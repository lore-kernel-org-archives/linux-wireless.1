Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795278987;
	b=oY0sibKowU1jCozl/dVeSe+dP77cYxLYIwLcoqmDJrfTN8JVTg3+010zbIcYiX3GvxLZ
	 SEupgR3ZiRaoYVOktfshAjhxZo8Ox4Tv1gSD/q8zhIHJSh99chMijeeQUBCqPIdgYLW4j
	 PkHD51urzToiHsg5DGlaeQ9dBbeHcaOBC9EbyKTGroRvshHxULumjVXc7Qw67chebVBI0
	 6ZmHcWrrczNdVJE61UMNu6l6x01Lro/XQMY1QnIfoBbG+fszCyHOSHxhn5UXWXjxTf3k4
	 UHrnhalTyW3hHwdpx23qifMGIBcJJFnkm2JYEimbHRQmeJP0TZ0hLhqGnJlYVq3MwGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795278987;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=JdxWEIL0M9ex9lHBtx8gNprPKuZ5+30UhfHTwNk0jrM=;
	b=B1RVyRWqtrKqN/lmFgQYh+qS8gAjc94yHj5ZKJCW4ulmdumny+fgU/WifMQj0mwgFQAq
	 vqVM64+tI5XQvjP2uRyHy94/49Xu9t5bws1xRpVI9wP+ZGwLKGD4QfbrEzNlRsftvJx9u
	 QJj8Mu76HkjLHgwgGufSsNRRkvan6Ptg4qouDYy64BHR9lgGj+V5PKI5TmqL9suYg4/hD
	 g8DMEfhl/fE9lhlcyzJf3U8QezQCzEcdACUwW07WMq0PNQG0L+mC25HwSp1sPS9ctnfOr
	 v05jUFLgqoMbLt0+SDKIQ6qWIMmE2nGywCEbAb79SzsuRi1f9WURY23W1YZbMLsL1LA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=E77nioXE;
	arc=none smtp.remote-ip=209.85.216.44
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECFCB606A339
	for <linux-wireless@vger.kernel.org>; Sat, 21 Nov 2026 16:36:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ECFCB606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=E77nioXE
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3b43d30822fso706125a91.3
        for <linux-wireless@vger.kernel.org>; Sat, 21 Nov 2026 08:36:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795278986; x=1795883786; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JdxWEIL0M9ex9lHBtx8gNprPKuZ5+30UhfHTwNk0jrM=;
        b=E77nioXEx6DTUNqfNXcdKo0zWowoSzsXLv5vkooVBnbC5TteHUj+9qERJY65168DJQ
         V+Bd4PTUI4E5MJQC53YkSuvqb2BzNwm68zCA1RzD4ISJLxD/JaV/0MrKJOqpDdt6gHQ4
         CPBXPatc0Sg02709BK1LCNdJa9aUi902nGLvs0TXOhNMciVSbPnpBASRG5KX0Yqoldf8
         aYfYvYS0rd+xtDgITDIneWq/Pa4oPH3/lso75yL4UxHWr9WjW/PhW4OAwgitrVPq8CKT
         5cJSjVOK5BJPo6G/kHYFPLd0aZG+PwTLmA2KHN0vYc5lR0Afho31kl8+weh3IytCA+mJ
         xGvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795278986; x=1795883786;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JdxWEIL0M9ex9lHBtx8gNprPKuZ5+30UhfHTwNk0jrM=;
        b=BK8XTlG8yca6jGkvp5CxHvkrfaKbgv5vYyLePY9Yq+G0JlDnJjBqw7bvDFf5qw/0Mm
         AIs+B/LWyDYwnb1sRsltizlhUalAiOi0uYVkCASSdEXr5QZNSW/u5iDzoxuHtGnofkv3
         HB/DwDoXJ086A3tPqyv3f33DOxRmhftmTv4afLEbcWwkw77xBWCixQlzKwmX4DK48a20
         6hYLymN2ox77Vp4Ibv0ZaBIEbeV34rZGiDa/7sFeHTimj4ITwfpCN04RRoH7F6Ke8/Y6
         x1d+dbYfIc3CLDW8ymUQV9QbfWdkiB7AvDbp3kRHxihNpMWqBCvAWP4zII3FJdxGmTtz
         AMjA==
X-Forwarded-Encrypted: i=1; AL+hErFjFGHZNrGBADN4Jn2HBfn6WVp5/e0U5Wn24PYFaKq68vvEBOYtCmnUb+7kkRfJj0GcNowpnBRCuFIFsvul+w==@vger.kernel.org
X-Gm-Message-State: APuU4Z+e8wpFtA8ANoLkxJAk5IKogfqmabyolQXGc+qwecCVMywMH3QI
	cVF0yqesk6IEHnoIIE6oDunjyh9O/SQgpMl8cS5sHhz4SV2WTxrq6F1PVwpZh0SO
X-Gm-Gg: AZFdTZdC01ZRQp0Ufi/9pty3NWiVbBpNI6hUg19MapIET+3Lpiy0QorW2A3G4piIW/x
	cg548RXGgWlmiGgtmHRVlqcQhf0MHgvwrkTYJ5ZikuQTgiHxnWjRCgxikvAmv8ipj0sEVGLAmjq
	vzhIBE/xjrQj1YL0687Fbu47Y+JVGIhOW1hQy621XFGnnVKYDdVQ85Iv3JuvpqINu4m6uakKWxa
	Fmy1rCJMbCdN8tuSdXnS6w8c5fothBi+XGW0LP5wJpWOrKoWL0TPl56LG0kLfL8HhYWWj9x4VW0
	yuUESXftp9rww79uxSx8iOFhAP2rIhBaJjZWTklIKWKAPTnlbyOd/iniQZ6/Bkx5cPtNGnj7xEt
	YPnAaxNWi/D98jBz7KLcroob0ZMZlgdD8oZn1EFh3WFsyZYZ3UjsqYJXPu7zYOqbnzkZiSiMXav
	XoC9nzVnoR3x1GaCI4mPWagi6F1IoXp9+b1wv1uXOFVixEF4/bHuxTLMAmFIa2vkRr0w404+Eed
	wuPSX1aMklz8CHQhiVJXt+TCJ2O8mHf/VrkQ1l7dUYZuHeNBQxcDWLSfZ6DM6zCJdwBd/FbGL4c
	5ZCBVSG3MzEqzm0MP5O+UrQGXnfMochlWSSYM7MuFn02tO8xd6gekrixkQtqeIJHvnkjf/LWRO8
	M+jQr
X-Received: by 2002:a17:90b:390c:b0:3a7:9e3d:b3 with SMTP id 98e67ed59e1d1-3b41c9beafamr5939261a91.66.1795278986142;
        Sat, 21 Nov 2026 08:36:26 -0800 (PST)
Received: from G7XWH7K1F3 ([2408:8256:2e80:7371:8549:3fe7:526f:af9])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405d11753sm12357403a91.5.2026.11.21.08.36.19
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 21 Nov 2026 08:36:25 -0800 (PST)
From: Zhao Li <enderaoelyther@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: Hemanth Selam <hemanth.selam@gmail.com>,
	Morning Star <alexbestoso@gmail.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Zhao Li <enderaoelyther@gmail.com>
Subject: [PATCH rtw-next 1/3] wifi: rtlwifi: rtl8192ce: don't mark unencrypted frames as decrypted
Date: Sun, 22 Nov 2026 00:35:45 +0800
Message-ID: <20261121163547.37019-2-enderaoelyther@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261121163547.37019-1-enderaoelyther@gmail.com>
References: <20261121163547.37019-1-enderaoelyther@gmail.com>
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

The receive descriptor's SWDEC bit is set when a frame still needs
software decryption. It is also clear for a frame that was never
encrypted. rtl92ce_rx_query_desc() nevertheless sets RX_FLAG_DECRYPTED
for every frame with SWDEC clear except a protected robust management
frame, including unprotected data and management frames.

mac80211 then accepts an unprotected unicast data frame although a
pairwise key is installed, because ieee80211_drop_unencrypted() passes
frames marked as decrypted, and it accepts unprotected deauthentication
and disassociation frames on a connection that uses management frame
protection. A station in radio range can therefore inject plaintext
data into an encrypted connection, or end a protected one, by spoofing
the peer's address.

Set the flag only for a protected frame that is not a robust management
frame, as the rtl8188ee, rtl8192ee, rtl8723ae, rtl8723be and rtl8821ae
drivers do. rtw88 dropped the same assumption in commit 0649ff58a0f6
("rtw88: Don't set RX_FLAG_DECRYPTED if packet has no encryption").

Found by code review. Compile-tested with W=1.

Fixes: 0c8173385e54 ("rtl8192ce: Add new driver")
Cc: stable@vger.kernel.org
Signed-off-by: Zhao Li <enderaoelyther@gmail.com>
---
No new W=1, sparse or smatch warnings.

834fc28d7880 (7.4-rc1) fixed "managment" in the comment this patch removes;
with the old spelling in the removed lines it applies to 5.10.y through 7.3.y.

AI assistance was used.

 .../wireless/realtek/rtlwifi/rtl8192ce/trx.c    | 17 +++++------------
 1 file changed, 5 insertions(+), 12 deletions(-)

diff --git a/drivers/net/wireless/realtek/rtlwifi/rtl8192ce/trx.c b/drivers/net/wireless/realtek/rtlwifi/rtl8192ce/trx.c
index 99472053ccff..3d11ddf86136 100644
--- a/drivers/net/wireless/realtek/rtlwifi/rtl8192ce/trx.c
+++ b/drivers/net/wireless/realtek/rtlwifi/rtl8192ce/trx.c
@@ -300,20 +300,13 @@ bool rtl92ce_rx_query_desc(struct ieee80211_hw *hw,
 
 	rx_status->flag |= RX_FLAG_MACTIME_START;
 
-	/* hw will set stats->decrypted true, if it finds the
-	 * frame is open data frame or mgmt frame.
-	 * So hw will not decryption robust management frame
-	 * for IEEE80211w but still set status->decrypted
-	 * true, so here we should set it back to undecrypted
-	 * for IEEE80211w frame, and mac80211 sw will help
-	 * to decrypt it
-	 */
+	/* SWDEC is clear for plaintext too; mac80211 decrypts robust mgmt */
 	if (stats->decrypted) {
-		if ((_ieee80211_is_robust_mgmt_frame(hdr)) &&
-		    (ieee80211_has_protected(hdr->frame_control)))
-			rx_status->flag &= ~RX_FLAG_DECRYPTED;
-		else
+		if (ieee80211_has_protected(hdr->frame_control) &&
+		    !_ieee80211_is_robust_mgmt_frame(hdr))
 			rx_status->flag |= RX_FLAG_DECRYPTED;
+		else
+			rx_status->flag &= ~RX_FLAG_DECRYPTED;
 	}
 	/* rate_idx: index of data rate into band's
 	 * supported rates or MCS index if HT rates
-- 
2.56.1

