Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795359900;
	b=qC8wfKrKK1hnzEV9H/A9LsyfcGzeOh0M98rqGdbZc7qJIbmR2yym71p/+mVC5VAZgc0+
	 ZBnLCy8ufK1nOGl2c/CgfptpUdV8yKLXg4CskUyN0HsygzScTiFjE09t3GXmrp/sUeg4h
	 XFMYm/a9G7R2STOWI1sdppoFXacV+uS/1WMfKVJVPGgl9EvPbYa9Ab7as6m7BGKW12dKr
	 Bh5niZwCNAwpvC2RPk79EcsMKnCAxDI8MZikBW/ANB479YRSTo1ljYC6fGO4Gm0AS1QtU
	 cY1xRsebyVSSnM0ZDaZmCMUOKJzsNOoUq7Cetp0pWcY1OAObqvHc5M+wLM65IGPSQmw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795359900;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=S3Kjv5gUA0i4xmmCT97hVtDcjtPqG6v26jtqrbXu5/I=;
	b=STF9M3ScKCSR6r/fZH7YqNPs+17WPLHa8b+odhoY5seg0bCi6h77Emo1nMr8TElx4I8y
	 e2AttJhraSRlcKdmli29AJrgVmdP488Jlyjz8+zXduFvBwqXXFfpkGzSL0CroBfk8cTy3
	 Pjt9CUPgC9XI6xlhKxOnruCOPCMRr/vMe0WpR0S8IUclC0hEZ44YzGjThPHV2J9FdeIt3
	 EPCvEw0jJh3rH3SQdCSNJ9npnwMdekHuDLpsapw0AcRj+LjShkguiGTZrvqATJ1cHwGEf
	 v2fCw7jy/p5m09p1e6FsO9F1StJ72rJhgwKnS92piUAGPgPMY86jXXc3ONxx1UYIEOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=T5UqsM84;
	arc=none smtp.remote-ip=209.85.218.43
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 739DA606A32A
	for <linux-wireless@vger.kernel.org>; Sun, 22 Nov 2026 15:05:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 739DA606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=T5UqsM84
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c50e26763a4so450764866b.1
        for <linux-wireless@vger.kernel.org>; Sun, 22 Nov 2026 07:05:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1795359899; x=1795964699; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=S3Kjv5gUA0i4xmmCT97hVtDcjtPqG6v26jtqrbXu5/I=;
        b=T5UqsM84sSbRtSgRqFzyGzslMGJxlWZo22b5JQyOfTWfbVRS4WD3j5myqtOvT5B2+2
         L+00Q6dnNWUk3LhZkBb3iM0/lmdDy4W1BQJMs3LTOx/0Whk+9XX1ar58kYQeJYOFmhHH
         IEhrUNO0+S+iWmshRIb29UAVl1tEx9otQvuzl9GO3rkknm/7vWaTsJ3NmyqdUs6swZts
         FrAjm4ziYqigWHx0XUl9v780VT1eIjdiQpeT+aUGMAKsOHAYcNbEPC7vkMNLAwALsuLw
         +soGEbpvh4XGUA/Q7s6NK0aBmkjeVuCfd+n3n1HsgKU4QL/ZjBnLXLltPKEJVKpKWXB3
         KS2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795359899; x=1795964699;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S3Kjv5gUA0i4xmmCT97hVtDcjtPqG6v26jtqrbXu5/I=;
        b=Mz2Jq4seZ+WagoYgNtFYcQqJnHnOnzhUZT6r1Ep/8e1gCQsuTBouL3UT5S1rDyMAbG
         uAHIBEWM/nWHYht/jLCOTeCLRS2AUrDqHlMsQKAFeAh4Q0KCHZE64V8DEZjia4oMdCkq
         BBJIdtNL1kPzsftgtQdKvWbg5KK9OaqL26PlIg0LloaPC7WDs0ynHr/H8PRpzhAJfSj2
         xcqjvJyzdro7gSZJ9Rf5pi1RykcP1NFZgevjmhZNeEl+9FtDDUIZfbg2sECF/GAhYdn8
         ejfJWY6uyyRuEQgYJvBYCrw8qN2aCRsAU2KNuukgZeNE0HdF1SWluz3fgA+3nFTL9vN2
         2zdA==
X-Gm-Message-State: APuU4Z+uPGGym/Ib5zcnP4YRRdQEGNsymwv1GkAxUjWfjd9HiA/GgEvz
	IngOXhaEpMrZbMboBLWzZnjTePVSrjZMw6tdew8Oqe0cJfzgXOe87LVuCnK0L9YA7Q==
X-Gm-Gg: AZFdTZeVlzV5Gyaz388Khm5g0nOLWqoG1YWW7WuKeQiv9X5SHiMzDlg266aofhrvj8C
	5xBSj7tPreEv4iGgJysfTkJbw2yLalXC8hUgTTjlMl4+tFZUy8pOOJUjGPWojDw+9Wmcx/7k9RQ
	aEaqCXn1hITLIF1IJppFunk3i5kgcD9W2TEVFpWZvZmHu2h4KEA/HeVRDyN3XEpdd9keZCV2hc3
	qOYOgd7y9qoaTKzLK5cdhqbsxK0IVHEWNqv9eux89Odo7obmNSiYbI7XCq4SyX9wp7MQeIrqFBv
	77TJWFJanH+RkpFU4T5cSVYn+vWgZFUAI4ThxdSWE7/b/jwd4sM72hdvxJ+APIR55oRJlItrUQ8
	Q+SPV9jhtq4sAUCifFqnyRreEl6GpzzPHB7mx+aPjwZPCsaNL56Wjm7SButXLadpMG38jCBqC7D
	tw9Mbw/2Ocos4ujfBuGPtBd4bV0Siduh2RxIWcYYeex2Zp61jtN1e37Rqp+2TLoA/yEcY6rlM9T
	NuXZg0Fm+2DxnywwDhn0S5jQiLIXhdOUzH5EeIoWMIDg2tKjn5EdLXWf3zrjIJk2YVoOwJ6+wW8
	U7P+HZbZkl8AU87h2/mhZQbwhFMFvA2C+Z3zMF2vLm2KiCSfGTQzwHPL/y29688KbmKYjIEANG5
	gOMzdIKFHHA7RGEeoOMBC6qi3gHWHFu4pPC0xlSGEeTa+qAvmHfqENTEjPf+Qoze1Co8V/hEXRS
	dge4Cu1JpSMF+VpNHHrIzGNS03xokBtjO9HTkj39Bfw8fw1rrPJ98HEJFrzYHagYR7QnqfK9w9n
	nI3xxXFm0VAqfr73k57/KMEJPGbdFhSBtUZB5GqZdX4QjnGompma66uwBY5la+90tdtXWgQNhso
	SOjOkaAZ0A6c+94RJ0Zz1xhxRQRr6My67/tfe0gymQHB+5WvNlhkWC3s3mjgiyjjn6heRHNC
X-Received: by 2002:a17:906:2b11:b0:c34:83c0:b92b with SMTP id a640c23a62f3a-c513aadbe9emr569793366b.23.1795359898440;
        Sun, 22 Nov 2026 07:04:58 -0800 (PST)
Received: from Desktop.tail070c67.ts.net (p200300f247132f00a1bce02c0b4f040c.dip0.t-ipconnect.de. [2003:f2:4713:2f00:a1bc:e02c:b4f:40c])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513b002b9fsm320086466b.78.2026.11.22.07.04.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 07:04:57 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Christopher Griffin <christophergriffin05@gmail.com>,
	=?UTF-8?q?Toke=20H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>
Subject: [PATCH wireless-next] wifi: mac80211: keep the 16 MB TXQ memory limit for HE radios
Date: Sun, 22 Nov 2026 16:04:59 +0100
Message-ID: <20261122150459.3108416-1-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
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

ieee80211_txq_setup_flows() lowers the memory limit of the TXQs from
16 MB to 4 MB unless a band of the radio supports VHT, on the grounds
that 4 MB is 64 aggregates of the largest 802.11n size. The 6 GHz band
has no VHT, so a radio that only has that band gets the 4 MB of an
802.11n radio, and frames queued beyond it are dropped as
fq_overmemory. Christopher Griffin saw those drops on the 6 GHz radio
of a QCN9074 with ath11k airtime queue limits applied, where the radio
ran at 1154 Mbit/s against 1609 and 1622 Mbit/s without them.

Count a band with HE like one with VHT. EHT implies HE, so it is
covered too.

Fixes: 3ff23cd5654b ("mac80211: Set lower memory limit for non-VHT devices")
Reported-by: Christopher Griffin <christophergriffin05@gmail.com>
Closes: https://lore.kernel.org/all/CAKobHXAfLKmJWSP_xNKwmNVkd4M92XhVXkVMcG5nxCBnbphH5w@mail.gmail.com/
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
I used Claude (Anthropic) to help write these patches.
I have reviewed the commit message myself and edited it where needed.

 net/mac80211/tx.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/net/mac80211/tx.c b/net/mac80211/tx.c
index cb9ecac25a9c..eb8a8441e9b7 100644
--- a/net/mac80211/tx.c
+++ b/net/mac80211/tx.c
@@ -1656,10 +1656,12 @@ int ieee80211_txq_setup_flows(struct ieee80211_local *local)
 		return ret;
 
 	/*
-	 * If the hardware doesn't support VHT, it is safe to limit the maximum
-	 * queue size. 4 Mbytes is 64 max-size aggregates in 802.11n.
+	 * If the hardware supports neither VHT nor HE, it is safe to limit the
+	 * maximum queue size. 4 Mbytes is 64 max-size aggregates in 802.11n.
+	 * A band without VHT can still have HE, as the 6 GHz band always does.
 	 */
 	for (band = 0; band < NUM_NL80211_BANDS; band++) {
+		const struct ieee80211_sband_iftype_data *iftd;
 		struct ieee80211_supported_band *sband;
 
 		sband = local->hw.wiphy->bands[band];
@@ -1667,6 +1669,8 @@ int ieee80211_txq_setup_flows(struct ieee80211_local *local)
 			continue;
 
 		supp_vht = supp_vht || sband->vht_cap.vht_supported;
+		for_each_sband_iftype_data(sband, i, iftd)
+			supp_vht = supp_vht || iftd->he_cap.has_he;
 	}
 
 	if (!supp_vht)

base-commit: e1dd8486807c1acf9551250b7f81e116a21e6ad6
-- 
2.53.0

