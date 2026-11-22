Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795385483;
	b=tAiaqJ3SDVOfsRIYlEJeX51A4hy8iowCQJnY/EePBniy8WHGXpIJ8iOEN1U/QHc/1K9v
	 tPhOzlDx95kpw/OBZybm8dwb49EqbONFFmHmsy2Bwy5+ZtBNaOuZKR1mSnsHSWOt7bu85
	 toBvoUEmW4nZifwy9QdYmcSXb52XlVl8epV2o2llcqelQ6ImpC8eo4SdwKYOkXqXcGNUJ
	 8gaNr9H7FtnTYfyIQs1n0LAif3QD/S65VUbZuwEjgai/4M5qpblRg+xbmB34y+GhSBQ1n
	 16ItHoJA+Wdb07V/vZjE2VVJ/NNLPiUV1FdI4qNO5DNLQoG3gMg+aUf8HoLtwa1b/6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795385483;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=NT7eFfs6WkxNgNowIC+ULTZcMm8aCZgXy7WoR8EwZgo=;
	b=tWV2Dizg0Wy+QCqfHc8nUG2RE402fzn5a6ahvjb9nGmZseJzpW3Bx1UUw912wWzQRosm
	 1aqqGVnMhQxps0O7pig3pVUK5VN0B5KzFfBViMriKUpOxdyxwAWE0nlVsp6BvNACevw6q
	 xrw0OESEfO90p5XBBGVf0Le/eR4v8t2EsOeqj9hNuHowdejSZKIrRsulNp7RnRP9+dfV/
	 OxorpF5qYN4lqMsNXcov8pTunKd7lGn2+t6tyOujZrep8PzqnuBNghkzQoMOf//c7btLX
	 ASoQbi0Zx31OfRCQLlD5F6e+x/S2vPXR33/oDBEu1cC+50V5GmVtx7OKX4BOwChpEJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mm+H+CtX;
	arc=none smtp.remote-ip=209.85.214.175
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 481F8606A333
	for <linux-wireless@vger.kernel.org>; Sun, 22 Nov 2026 22:11:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 481F8606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mm+H+CtX
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2f04fab527eso17997705ad.0
        for <linux-wireless@vger.kernel.org>; Sun, 22 Nov 2026 14:11:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795385483; x=1795990283; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NT7eFfs6WkxNgNowIC+ULTZcMm8aCZgXy7WoR8EwZgo=;
        b=mm+H+CtXuUnDhCgOJkFFTkQHyA2htZw9KSqBk7j9qLKXEjHZXv9pEQ/oQB4ZnjKP5k
         9Z+Qz6iZkyQwmWrnjskyyKn6Kq8HeRR81hi7HFffdD/PHko4tSq4BprZVGhldktaZDSB
         4YjF5dHlp1l5Kp9of5vfZBTE/Na/rAL0Krn/1F7wwWwR+X6ajMBwLOvRgjQcCIm52aOO
         aZB1zdGQ2GpB8yO9ovNqSObOaFRzaJDKdeFCD2DXI90uf+OiItgLZDR6kf8m1paHbu9c
         PulQKTibYrTomvOFvGiGATTE8ILHHPBJvVJNrul/eeoPQ7Us3HxYDZtP8PtAx655RY3L
         v04Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795385483; x=1795990283;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NT7eFfs6WkxNgNowIC+ULTZcMm8aCZgXy7WoR8EwZgo=;
        b=qqRKr5HrOUDnkgu4nt5vF1DwDFBuxMIxlTvPLmLuqoviEXrQYBWIf/3aHj7VlSTnMN
         xPHwis4gZSsSGrnAy6+gG8coh/WPE8/B55myCI3DmJRlkSFukI+r+P802VFH4mV2TQ5v
         I/8z0ede8Nz1VfmatwV46TTW6A8JQ/wGL6mrLFhRi4kaNyy+FYnlbfjBqJ1Yy5Q4xc/v
         m63bZwZ1hY5dtm938q6Uwh7U3fgrhyLV7cALS79BdenBAYqJA0XfPhlpG3mt+EipqBHm
         oDA2+DSzcVzV7c5QIXYIn7PRPbCGI6fxAzl/VWYtNVZN7q9etx2y1wAGbFzNRWS3+W8M
         XSWw==
X-Forwarded-Encrypted: i=1; AL+hErHRB1OCEuopbffiPpZbfF2zOugOGYiuSPbjRPMRFynW1dERlUUOh1szlubd4+ZfMrjk500xcBVm7KkPH4p2GA==@vger.kernel.org
X-Gm-Message-State: APuU4Z8f3aT0XZhFbtK8jz/ZlUSdnpxqH/KUWE2ARHypdfHcMkncSbmt
	6RmDfwONrh/P4cuXUfZVsm9ziDy3fLAfu7oPpL25AqWHopXqqlxlIg0I
X-Gm-Gg: AZFdTZcCe2cyllwtPjCzE3kOjCMznDImzXKt59r/PyugRrPF5xeCiPCJ1h2YKZV1fNB
	UBk+qOgiCACap83VjZ95xSzSDXCo5QGle1aLJrJTdp9SUzfVUQaEZrGuSyGIlIK37VTq1IK1iFI
	NlgZHA2EYvw5eFxfDLlD5p+Rxe9+XONeaWOR5i/b9iI/gSkSTYfLnttxGz1+No2h0qvQnSF1tlM
	VtnAbw3xVARtzEVwzpJsWVjuUuPMWuh43OcWikeXNaWxb6uIqaa4wOSnir00gOfB6K9sP/+OPxS
	Ud3pNVu3ovMtJwWinuYdic/7gQvfAhbf9KwIP5ih+oT60/LMDW5NYlc2q1nXuQPctN1QqeGJfRF
	ChKBN92f7U6cpQIMmL98NS3X/xkmsCg1ac5HT8v+6+zOww9UayQSm4pVyAms4HZ7NunYl6FkLPr
	T32nNk9QRl6mEFdNpcoICnmGCoSdPEfefb4Rv8uvf+ALNfwACEXdeSdn8BPAP0qJkWfZnezKG99
	qPx5ZJyWQ1O9FazNUIeAFX9dZDOciERZNg3jOSis2C3lcQPxtwuw0+EwZK4BikvH7wtzhTpln5W
	bYGd1uT3i84zAKeeoVXkMM4wcK2JWUYACAurktMUEZ6igibsfiQ9Lf5+DiF79fDXvWLB
X-Received: by 2002:a17:90b:2d8a:b0:3ac:450b:164c with SMTP id 98e67ed59e1d1-3b41c96cde4mr9444836a91.47.1795385482676;
        Sun, 22 Nov 2026 14:11:22 -0800 (PST)
Received: from d20be28ee783.tail196be.ts.net (vldb.skku.ac.kr. [115.145.173.180])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405ec698dsm17277003a91.14.2026.11.22.14.11.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 14:11:22 -0800 (PST)
From: Kyuwon Cho <kyuwoncho18@gmail.com>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: Sergey Matyukevich <geomatsi@gmail.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH wireless] wifi: cfg80211: unlink hidden SSID members of the merged BSS on CSA
Date: Mon, 23 Nov 2026 07:11:19 +0900
Message-ID: <179538424838.2896923.3237950934209281172@gmail.com>
In-Reply-To: <179538423867.2896802.12596731671226623616@gmail.com>
References: <179538423867.2896802.12596731671226623616@gmail.com>
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

When the associated BSS moves to a new channel,
cfg80211_update_assoc_bss_entry() gives the IEs of a matching entry on
that channel (new) to the associated BSS and unlinks new. If new is the
beacon entry of a hidden SSID group, __cfg80211_unlink_bss() refuses
while the group has probe response entries, so the WARN_ON() fires and
new stays on the list. The probe response entries keep sharing the
beacon IEs that now belong to the associated BSS, and read them after
that BSS is freed:

  BUG: KASAN: slab-use-after-free in nl80211_send_bss.constprop.0 (net/wireless/nl80211.c:12959)
  Read of size 1 at addr ff1100001428e61c by task test/115
  Call Trace:
   nl80211_send_bss.constprop.0 (net/wireless/nl80211.c:12959)
   nl80211_dump_scan (net/wireless/nl80211.c:13105)
   genl_dumpit (net/netlink/genetlink.c:1026)
   netlink_dump (net/netlink/af_netlink.c:2360)

Unlink the probe response entries of new before new itself, and clear
their beacon IEs, which they no longer share with any entry.

Fixes: 0afd425b1b64 ("cfg80211: fix duplicated scan entries after channel switch")
Signed-off-by: Kyuwon Cho <kyuwoncho18@gmail.com>
---
The patch was written with LLM assistance; we reviewed and tested it.
It applies to the wireless tree. With it, the reproducer runs without
the WARN and the use-after-free, and the station still follows the
channel switch.

 net/wireless/scan.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/net/wireless/scan.c b/net/wireless/scan.c
index 1c50a16c0e9b..898cc65d6b1a 100644
--- a/net/wireless/scan.c
+++ b/net/wireless/scan.c
@@ -3490,7 +3490,7 @@ void cfg80211_update_assoc_bss_entry(struct wireless_dev *wdev,
 	struct cfg80211_registered_device *rdev = wiphy_to_rdev(wiphy);
 	struct cfg80211_internal_bss *cbss = wdev->links[link_id].client.current_bss;
 	struct cfg80211_internal_bss *new = NULL;
-	struct cfg80211_internal_bss *bss;
+	struct cfg80211_internal_bss *bss, *next;
 	struct cfg80211_bss *nontrans_bss;
 	struct cfg80211_bss *tmp;
 
@@ -3533,6 +3533,15 @@ void cfg80211_update_assoc_bss_entry(struct wireless_dev *wdev,
 				rdev->bss_generation++;
 		}
 
+		if (!new->pub.hidden_beacon_bss) {
+			list_for_each_entry_safe(bss, next, &new->hidden_list,
+						 hidden_list) {
+				RCU_INIT_POINTER(bss->pub.beacon_ies, NULL);
+				if (__cfg80211_unlink_bss(rdev, bss))
+					rdev->bss_generation++;
+			}
+		}
+
 		WARN_ON(atomic_read(&new->hold));
 		if (!WARN_ON(!__cfg80211_unlink_bss(rdev, new)))
 			rdev->bss_generation++;
-- 
2.43.0

