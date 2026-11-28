Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795849457;
	b=W1ycxMfuM9mS71GW2JX5TsNH/BSEi354N7h1m4M2NQiu1SVBKxXhceB1P4t8fSJ1ImMf
	 JoT+Ffyalvghsg1VFxHDTNLnf3+N1EfT10m3nkupy8c/aGsA2oy7qEhUZRK7z3yUD0ih5
	 jOx5w6woNK+fDpr2tkFpE1OrgetNn/XdeXWyEetHf1YjpnC/3nJ5D5NS2knq7187wNaHm
	 /nOuddqvPqkZ0/u9PEeq1vEKsR8fhahQqwQoJ/01m2MW5gpgzsd9co3/MfUYh/A29QT8U
	 zY5LKoKOjRtUogxBdrzqNn/o/L2n4LEM5k2/WqUoulpze+WwQj3lhwdK2uRn3XU7Fcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795849457;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=AFcP9NNxUl4a2mL6CHFH6vOWaV8fibkV/Z33M40xh1k=;
	b=PDyalPrmpPH+qYVri7w3MpPrQxD/uy3eptX+gFfaYEYioZ5RkjvIZVkGVp5++d5dPGtH
	 +xx8esioUV8z5GbtyI0HPR9w+qBm4sdNtWbbHUucb3zjS60rNVkb+TMBS8HNW8ZM30R/Z
	 uA2xQeD50RftjYP32Y5+EO29PMeIIaTWGR6scoB8w1X9PC07MuBvnVO+pliAho8AMZSON
	 7SkH/D2rIf4joCgmFI/rjmZHAnBS7LVwNQuVbwNrNmF/sVMzrSQO90asRk6i6aTPVkIXI
	 cTiRvOLbCmkk/DwBS1X6QFJJC6ZW72kaHMDLpfqXwQxn7WN74h1yRVKhlo3JYYUCqow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gPcdwAKB;
	arc=none smtp.remote-ip=74.125.82.48
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EC34606A31F
	for <linux-wireless@vger.kernel.org>; Sat, 28 Nov 2026 07:04:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4EC34606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gPcdwAKB
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-1a2761c69fbso13245400c88.0
        for <linux-wireless@vger.kernel.org>; Fri, 27 Nov 2026 23:04:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795849456; x=1796454256; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AFcP9NNxUl4a2mL6CHFH6vOWaV8fibkV/Z33M40xh1k=;
        b=gPcdwAKBphmf5BjeewSuefUHh4OaGxgjn7v4CyMq7bNaT2A1dxOtAomRja7/SoSMAl
         laX2h2HkrgN2Jttz/xZ5kOmSgz1G97cjtqHbsBnmNipksK2Vc6XYWUPiCWnQ9sGhUZSU
         ZeZZZRI0pKuEyAl4ivlpNNS18NpcSne1Q66CvAUswQDGK8k06f0PElx93FPEFs8Jewpu
         l3havVzY0SOXOIIAQC90Glajir9nJBnwMhs8LN5/wlXUDMo93BUSvoFlS3hDFj122ozN
         5qH4wnAe1MnvF1ipGNc2IvJiEw2w5q8+/eqtr/gGnIh+Ntr3ZCvPNsqAvaVGLCNXhXnP
         p4/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795849456; x=1796454256;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AFcP9NNxUl4a2mL6CHFH6vOWaV8fibkV/Z33M40xh1k=;
        b=ysl8t0RBeRTrwwdwhVnW3Ss+nTOYMhJhnMoj9H6amAwpazzLAKgfuciv8HWPSsJaQb
         jfWZDJL2T/3LMIyRbZiLRnSyMdZU9WS6BbBbNOMRysUFIypdZOwsy0Jsv3ywrwarTYZZ
         PS0IsRJUD3/84FWX3+ZMxcZUbc1aqSzZXKPvvtYU7hjhMfTx3RpYgmver1BAv5r8j/8m
         n9MPzZ4k21QpB7sYcOCv4ji6foiDE7PaRYDYE0gyCGApVZNKjyF8cIVBDn5aIlQ+vfFc
         gBka47Swu/VCVznrM5+XHLzu1tJ8RhUcn6BIcuiwmtfxg1XGNb9M1OUW3PnCOyOxJR98
         eW5A==
X-Gm-Message-State: APuU4Z/FcVQUVXW25Agv9wwqeAqSkuQ35ygquVhdRjsSc1wHqJMwibw+
	G+UYogeiNPIosSXEgMeC9oqYPTeRWxaRU2/CgcBqJPIMO7UEAJMknJEbT0T/IQ==
X-Gm-Gg: AZFdTZc2zUOI+3OnQvROjcdznl5mq6D1Lnn+y1O5otAK0fvJuRk0heFf/Bv+IdI8axA
	1au0kkFbTyM5RGzgdQ/J5HF06quxlPX4qQeRQfyUirdPVUkrIqF3oj8uMiWXAH1jiPEQgu+Z8Pn
	Px5GaT7/dx3Nm21K82TiZWM4j7PrRAcfvx1NNJoBKO+0DhvX5nFvNkL55MmbhD0zbCdT7koMzGU
	aFU/t+QcBtxhx7kVwPm9OQSu4ys0W3niTXZJV3d18ybc30SQdueyIoho5jYvjzfsJ995UcOPIzJ
	qpKA5CKYybsUrYMXnQ/K78I4HGgtSY7pMxRxVNhUNa+4G64P4BGW5sP+6dCFdJv+JM5wUjR00A4
	2agSjSmh0/IzXX74GBEcj28cg/k6ggvlzlao43L5YW5z85DcokfyZaLov/MHKW6n5M1rU0l/mBR
	fw83AV2IFk+c5eCF2qIrlOQCWm4zMPEJ/K3V2thQCA32WqWZGY118vji4D6KQIojGBAH2iVLaz0
	AEGYLgu+xo90Od8B/rhWw0fStHBL1YzPhrJBDGz8vWKfdLrnmSib169QOIbAeJrDi/VWVjO/C3g
	lrl1Vrtzi+bHsm3rJrj5mY1+sy8CROUXux53uezWJtT+oXObqGM=
X-Received: by 2002:a05:701a:cccd:20b0:1ab:aaf3:389d with SMTP id a92af1059eb24-1b5568234c2mr26200601c88.1.1795849456444;
        Fri, 27 Nov 2026 23:04:16 -0800 (PST)
Received: from tach01.nordicsemi.no ([2401:4900:1cb2:1222:8ca1:bea2:3bd1:958d])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b56ef9fd16sm54740763c88.4.2026.11.27.23.04.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 23:04:16 -0800 (PST)
From: Chaitanya Tata <chaitanya.mgit@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: Johannes Berg <johannes@sipsolutions.net>,
	Chaitanya Tata <Chaitanya@dotstarsystems.com>
Subject: [PATCH wireless-next 2/2] wifi: mac80211: log when an AP's UHR elements are dropped
Date: Sat, 28 Nov 2026 12:34:30 +0530
Message-ID: <20261128070430.3784598-3-chaitanya.mgit@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261128070430.3784598-1-chaitanya.mgit@gmail.com>
References: <20261128070430.3784598-1-chaitanya.mgit@gmail.com>
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

From: Chaitanya Tata <Chaitanya@dotstarsystems.com>

If an AP's UHR Capabilities or UHR Operation element fails the size
checks in the element parser, elems->uhr_cap or elems->uhr_operation
is left NULL and ieee80211_determine_ap_chan() falls back to EHT
without saying why. The only trace is the "determined AP ... to be
EHT" debug message, so a UHR connection quietly becomes an EHT one.

This happens in practice when the AP and the client implement
different 802.11bn drafts. Since the update to D1.5 the DBE
Capability Parameters field is three octets, so this kernel drops
the UHR Capabilities element of a hostapd built for D1.4, which
sends one octet. The client then associates as EHT, or, if the AP
requires UHR through its BSS membership selector, fails to
associate with nothing in the log pointing at the UHR element.

Print a message when UHR is dropped because the UHR Capabilities
element is missing or invalid, and when the AP included UHR
elements but its UHR Operation element was rejected, like the
existing "drop UHR" messages for other invalid UHR information.

Signed-off-by: Chaitanya Tata <Chaitanya@dotstarsystems.com>
---
 net/mac80211/mlme.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/net/mac80211/mlme.c b/net/mac80211/mlme.c
index 4ea214e25056..9a7cade8076f 100644
--- a/net/mac80211/mlme.c
+++ b/net/mac80211/mlme.c
@@ -272,8 +272,11 @@ ieee80211_determine_ap_chan_uhr(struct ieee80211_sub_if_data *sdata,
 	}
 
 	/* frames other than beacons carry UHR capability too */
-	if (!beacon && !elems->uhr_cap)
+	if (!beacon && !elems->uhr_cap) {
+		sdata_info(sdata,
+			   "AP UHR capabilities missing or invalid, drop UHR\n");
 		return false;
+	}
 
 	uhr_cap = ieee80211_get_uhr_iftype_cap_vif(sband, &sdata->vif);
 	/* can't happen since we must have UHR to parse the elems */
@@ -608,8 +611,16 @@ ieee80211_determine_ap_chan(struct ieee80211_sub_if_data *sdata,
 	}
 
 check_uhr:
-	if (conn->mode < IEEE80211_CONN_MODE_UHR || !uhr_oper || !elems->ml_basic)
+	if (conn->mode < IEEE80211_CONN_MODE_UHR || !elems->ml_basic)
+		return IEEE80211_CONN_MODE_EHT;
+
+	if (!uhr_oper) {
+		/* the AP did include UHR elements, but they were invalid */
+		if (elems->unrestricted_ap_mode >= IEEE80211_CONN_MODE_UHR)
+			sdata_info(sdata,
+				   "AP UHR operation missing or invalid, drop UHR\n");
 		return IEEE80211_CONN_MODE_EHT;
+	}
 
 	/* if UHR parameter update is invalid, ignore UHR entirely */
 	if (elems->parse_error & IEEE80211_PARSE_ERR_INVALID_UHR_PARAM_UPD) {
-- 
2.43.0

