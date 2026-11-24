Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795554874;
	b=jDxa3ZKk0Yl7zcoMWKwRFHMMCRoBBsZVY8HTRKMNYRVqfxTsxSz689M9tLe+hflOaquO
	 1g3h/qnQX0AUVvjqRGT+Rfe3ecFWtls7AE5QnjRBzdV4B4vPtub6oe12QuHXrz4ggw689
	 cHQxTPfKflMxbx4VUkmPHBGOyn61PlWe6EOdsUOtIa+LeLJGb0Ej6qi0Rk4yNmxHDkzGt
	 hu6vuvZFHMMshgPipTAjeKiGlhCov0D/92V19618J8lOGBZVlk5HqJMjgSWdReZv/gBOh
	 U2MzIppTCKvr18jH+HxnEm1BUtoVCA2AG3olTwcr7wjI8fslPCDDPUzmQzj8IySPRJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795554874;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=vgciMLNfI9jLoJ+Pifxq56a3ha/CYrPvUBDNbhpqe/w=;
	b=JkRPTk8dvl0LBSYCGDytq8P/ue5QCeruKyjKV5GYaWFdCPKeP995LGY9hOxZvcNLvR9N
	 BolufodN9VnoWzUjhecsLBRUY7TEk2wHmNuj7hLoDYIbT4wn2v+uUs412MwmWL/8yQnSg
	 X1Irwhq3LRf/1ODRUZDSJE4wJJaDUWaLJz1jaK6BTqP6h42DvfVWzAxuB/7GECpMroDm/
	 pu8kYdW+kiWU45fDpvlRqItvdXA6TZ7bLYukc5kFzWSlc6lqdPaeoSTjiOaGJD4VcWyif
	 TtvNsQH81Z4azSTj2QSma9PWbalKnjPD4oQhucmHN6PfuMKMFy4xXU8AXoMs513dZtg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="Yc/1Dq7R";
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 434EF606A33A
	for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 21:14:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 434EF606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Yc/1Dq7R
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4bb68c197c7so64229585e9.1
        for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 13:14:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795554872; x=1796159672; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vgciMLNfI9jLoJ+Pifxq56a3ha/CYrPvUBDNbhpqe/w=;
        b=Yc/1Dq7Ry24BZrxlQ7+aamVklRBdEgR9SahO+SAA7bLaqls/tl86on5Orn4Y6BpzZ1
         tZ7LBD6LTqO/oBSDYWmDReh6Yh59+qFGOav3RsvZ3a3e+PaPpP6xTfLOT0ugIrh+90MZ
         rPs9NF4gXgW7k+KSsL9nE2lg80AvtQf9q1TVlNLLvwBJeVQi5AfCpa9G0HRLGNC3xrL+
         ZjcZNIkHdHDvjzOL3tP77pvwspHrehS6MI+HFg5MHO63ZHXpbrH2U4bYVZLCYUwFPIOq
         h9DLgRcmctyRL3O7ehFc03zeuurQ7OEFuN72gzZ8Ae1mXgxQSZS+4Nww54X2Hrj/CwB0
         forg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795554872; x=1796159672;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vgciMLNfI9jLoJ+Pifxq56a3ha/CYrPvUBDNbhpqe/w=;
        b=gU2pnP9TZ9sgB+ARgPmqrU8sqozkWkQ+lF4UMoRn8L47+vrpmHYAHLyDU8+nN4Q8Vd
         VYhR9tW1GA+EdK8DIwDB9UlWzCpWkN4IqTvGrvfYQj3Gk1W8WuTvBCXWK0HmRD5n7XKJ
         SzoMEYH2wXE8mvx293WT8DtNNqytsyQEzXyOacV+dYicMnf1OSQKWATxxk8HNwNNhauk
         sKhKRXjZR4l4vN3DsImrF89NdCAgUjEb5dutO+7Y61nJgcBspxNFxKLs7+iqgqBmSnQk
         ZidcpBCLZqixy7H2ZewUxNjMqu/SG2DoPnm00xd2zKxTjZUF0ggRkuInq9c2MpjxMAvP
         RVRw==
X-Gm-Message-State: APuU4Z9Nxn0uCiH98Qw8aCfnhsPa8BKSce0bcmmV2yqLRH9j4Qf1jJgW
	/QiH4xk6tQ3iGTzVbuEnNe+bESLfpT4qisTjFiL449B8NCakytpoEG9N
X-Gm-Gg: AZFdTZciQZ2F1SeVHvxbWh2xKnuDNba0YYEUl+mCxDbOgc1JkyrruQDKfg8HJtVSTOZ
	SZrkIr7SJ41TfCx+3DTkegiVKsuAijGjuvNC9WqOvSRKN4RGI8feYBnVk7C3m+/ERhq0Gkfuynj
	e7G75oPGE/9/Xw3VJKJb3OX5SI/Hf6XKvc2bpTho993ikv39NBQsRrGKNfNzZFTWCpsNnRWJaBB
	UAQj+NZ0M0tdzGicUroob1KSkylemCGLCKBjOxSuYqTbEZylElcXOifwDlEvUx8hyvR/JQjWUul
	dJlGLNoUpkYGF/vyvEr1GswNCKFhi76U3iNiJO+c5lqKhxvdJ8nVi6pn/6ydkRLn14qeePtEIhB
	7YXTS6hETGQ1kW0GqYIppXuFbvXkYR0JND/KGuoubaLO4aiUxZpGAGeP2FBm+maCoy8MHilW2iY
	HtP0fQF1n1YHHH4tldEB/lv/XDZjGMq9oXAY/fUalDUqXRBCDuOcCDDmAxssOfr0IZXJ6OBLeQV
	+fN7Q4DAmdo657hnI1fafsFQpmUKQz1W6FJXS+S5qCyfPakvZeL0c+nNtymGpnRu+Y9lmyb/nLJ
	x624tnkUo2s9/bew6rjIID4749xavkkO0tZJ7Pwl/7wJG0Im5/bMifkHG0bvRBuOhHKgFUfeiKV
	5PNbeoSBxFy33tHa620fdufCUEMLBnOkbNk4Sx47iLgec1FjpD+ZPIW5V0S/4A3FAcyGhZXI9Ep
	KLpTK13tSBSlBFeq1NJOcCpuv15XgYdRbMK8vglHRwl1UpVTBG2cB8Yg==
X-Received: by 2002:a05:600c:3113:b0:4bb:5f45:c97f with SMTP id 5b1f17b1804b1-4bb88816b2bmr343585825e9.27.1795554872462;
        Tue, 24 Nov 2026 13:14:32 -0800 (PST)
Received: from localhost.localdomain (dynamic-2a00-1028-8388-a84e-c5bc-f938-520e-21e2.ipv6.o2.cz. [2a00:1028:8388:a84e:c5bc:f938:520e:21e2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8533579csm408171665e9.2.2026.11.24.13.14.30
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 24 Nov 2026 13:14:31 -0800 (PST)
From: Josef Schlehofer <pepe.schlehofer@gmail.com>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org,
	Dylan Eskew <dylan.eskew@candelatech.com>
Subject: [PATCH iw] iw: util: fix the EHT PHY capabilities buffer size
Date: Tue, 24 Nov 2026 22:14:30 +0100
Message-ID: <20261124211430.93249-1-pepe.schlehofer@gmail.com>
X-Mailer: git-send-email 2.54.0
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

print_eht_info() stores the EHT PHY capabilities in an 8-byte
buffer, but the kernel provides 9 bytes. __print_eht_capa()
prints all 9 bytes and accesses two bits of the ninth byte
through phy_cap[2]. Both accesses go past the end of the
buffer, and the ninth byte is lost when copying the attribute.

Increase the buffer size to accommodate all 9 bytes.

Fixes: 4c859917316b ("iw: util: update and clean up eht capa printing")
Signed-off-by: Josef Schlehofer <pepe.schlehofer@gmail.com>
---
Checked with an AddressSanitizer build that feeds print_eht_info() a 9-byte
EHT PHY attribute. Without the fix it reports a stack-buffer-overflow in
__print_eht_capa(), with it the ninth byte and both of its bits are printed.

 util.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/util.c b/util.c
index 1bad4ea..1a35352 100644
--- a/util.c
+++ b/util.c
@@ -1769,7 +1769,7 @@ void print_eht_info(struct nlattr *nl_iftype, int band)
 {
 	struct nlattr *tb[NL80211_BAND_IFTYPE_ATTR_MAX + 1];
 	__u8 mac_cap[2] = { 0 };
-	__u32 phy_cap[2] = { 0 };
+	__u32 phy_cap[3] = { 0 };
 	__u8 mcs_set[13] = { 0 };
 	__u8 ppet[31] = { 0 };
 	__u16 he_phy_cap[6] = { 0 };
-- 
2.54.0 (Apple Git-157)

