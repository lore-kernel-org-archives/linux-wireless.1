Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794964075;
	b=g28yax/yq+C92AuqfdHhVnzutTyQq5j9/Ob36madwG8wI7pPZjXrQvjpRD/LKYbcSr7g
	 LV9A/xIH5/n9d6XtXE2cmBa41ajMN0wv+86HKbRooDOHF9+SJ5wU+caHIrtWDCYB3pezP
	 9OAfzHGrtV0jqKSsMtPBO2yBepcUDCC4ux+C9ktP9VehRlQ+/lUF1kkOqoTDTDlJlJrbn
	 vaQiEIHSAdOc0WolaUvXMW4o9Ek+zqM8EU2SDSjitfkiRHLASKCUsoe54XRDGbj2rptBa
	 agf6hkJ0r3XKcaNIp9FVF1QO2yDZqtiLqCIL6MHbh8vqHT7yj1tcKMTPW7lUz/+6psQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794964075;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=R0zIGSRBWJBSc+IUZ+tl+46y73JnsmifVkzBw8YC7rA=;
	b=FLKRWFp96pVAjheN6UUig0oNZBfn9BVuiVx8anlOBaW1IVpo+q1Fjt/WzUeP+BDnbUSO
	 b7e8fZiC5eSZNO4Hw4Fw5UlCzXE7Bel9NWVnHyiHCgMwYUv/VeFOn1hM8eGJa9buK+4ei
	 P3oDUDlokA9k5d7IT8eiIKs4gsD9JPbJ76rdbKStuf6WpEMoADodTGZspgcr97UTTw09V
	 D+5pj6IBtiyiJjRsyM+mBBgJWYQFEmclTiGECl6rwOUvsHvAgS1IfgERvWEY+a1fpfdK2
	 34yr8YXhDjd1AqDmzbx1hIqAjXH32YVrdTVjrHEYF/6T6mb5ER7mPTB9axOF0TSBxQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=morsemicro.com;
	spf=pass smtp.mailfrom=morsemicro.com;
	dkim=pass header.d=morsemicro-com.20260707.gappssmtp.com header.i=@morsemicro-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=JlxMj1l0;
	arc=none smtp.remote-ip=209.85.216.44
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBDA0606A31C
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 01:07:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BBDA0606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=morsemicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=morsemicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=morsemicro-com.20260707.gappssmtp.com header.i=@morsemicro-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=JlxMj1l0
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3b0e0e65adbso161121a91.3
        for <linux-wireless@vger.kernel.org>; Tue, 17 Nov 2026 17:07:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=morsemicro-com.20260707.gappssmtp.com; s=20260707; t=1794964074; x=1795568874; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R0zIGSRBWJBSc+IUZ+tl+46y73JnsmifVkzBw8YC7rA=;
        b=JlxMj1l0JyWo/ooXpzxZUCSRUjhWX0EEiWrXJfmu6aCmeT4pHCxc5DQyExxDopFDqF
         tP+4SmQSVYj3Q4M6sc7+Ieo+Kbh78LCYxTKALmrSs74z7afYw+V8hXSh7LqcUrJQ1/r3
         3825nz9Ss6ftE9eZo3CbaGZQGYA8WUvkPRMhT7st1LCuQpGDgCiq8ep1FIRdeJfvpiUS
         GjzI1V5BNKtyBHvfkyimyFR/8YgAIvPHsksQfLd9U/9ZIbXYM56/k1jDWla0rwuJD8CT
         ZMNVpLqZypSUaqB7Kgwv8mNEvZCF3ELuXxu95zhqfNScJeo58M0oWGRDnhLhlRcheoEL
         n1Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794964074; x=1795568874;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=R0zIGSRBWJBSc+IUZ+tl+46y73JnsmifVkzBw8YC7rA=;
        b=Pl5KIgsTTIbq+yZRPDM7LrdPUvMwDt3GPThRenqQ4LB7L7ht00hcyxPzMpEIiS4evA
         cgY9uRoHOhxtJe70NhlsZn5k5vEAB8IAOucyQaWaOwUL+jmBLwjpQuQkKXS79tO0lWXQ
         jb5mBcJWlQAJhZCSybi9y6LWAp90wmZ3MTHI/qiDkHdwBV9uI+c3jaoHsSAB8IQsNhj+
         kOaNPPCJ7mBes4f/j7xmg5zVQpaAFuj1W0zmCItsA/LomTlyX8Ks/5IdnhhntngW0Lc6
         6x2HRezbBUF+DUcOk0BfCqEdESzYykpUOtqR7x3fGrS/r9TFM5v1Xg1LDxe99h6WvdiQ
         DjnA==
X-Gm-Message-State: APuU4Z88O3Pppkz0ZiOMD+U7K2ApmfDdipHpBdPMXEACVfJfrY8mZZt+
	qr8rYqGvRPTQ0aDlkUOtkEE0+ail/vA0YwzwIeH0CHrhSmGoXH9tTD7qeggOmiUO0oc=
X-Gm-Gg: AZFdTZcZvAaIAlUxPS15FjT8rHE9z5EtgEghrG3+Lbu0ztqBfM2n9yJZXkn0rbzCKio
	3bWYHV5Ayvpeiid9rxSyZ+i9Pdjc8suQQ5HxOVPWTfa4sFR0yz2vKLSKFjCinalsm72njJppG29
	5NNUcXPI+rNdXXhzFLa4ZyHRJxMw7i6iwDFbd1F1KGvzRxl8rbIBUM79Acdfq/wGavcYQO6yn7H
	4+Suk5SHw7DKsEeKujzjm+pOnvTtzcfsFtDtoCVgcdReRdSyYM295AkuI6dmvp+ZLJzjEi010Yw
	0xw4v22HnYQDR5W78UJQN6bd9WZvHi/f0dR4Ne0DXnrfq8YQUy54Sp9KLJPa98k3FrPZUehjN2T
	hXxU5V5yO1iPRPfZ3jQk14j5fOtX935OCqpam32Iwp9aX9kLiJb7s0yTgpf98WGrh7S+lhphStX
	IJ16y7xKr5ou30vJB22BVpkGRIwF1LTIGxY50L+LJrDIagg/8epPqovUYbLyMZcTX540b88QRTQ
	hTeaxIlIXxhe9A72PG1mb/nf2kYaP5doitE72Mww0u4tgo2ZskxoZpEpwTT66zzLaRsd3P8IMWp
	urosbrIxe7QxaSkvfu2oheJRQqEBiTXW7MnMD1hYLIiCHjf5SJU+R0q9ZVEam+WWjceXdE9FJPc
	nhQ476dB9I0zPGtOwtBannaIQwLCP97wj9Q==
X-Received: by 2002:a17:90b:3890:b0:3b3:ab74:cc9a with SMTP id 98e67ed59e1d1-3b3d04d25fcmr1106751a91.0.1794964073550;
        Tue, 17 Nov 2026 17:07:53 -0800 (PST)
Received: from mma-H9MHD44.lan (60-242-93-14.static.tpgi.com.au. [60.242.93.14])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3ac2b5ec6sm6420780a91.10.2026.11.17.17.07.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 17:07:52 -0800 (PST)
From: Lachlan Hodges <lachlan.hodges@morsemicro.com>
To: johannes@sipsolutions.net
Cc: linux-wireless@vger.kernel.org,
	arien.judge@morsemicro.com,
	samuele.yang@morsemicro.com,
	james.haggerty@morsemicro.com,
	Lachlan Hodges <lachlan.hodges@morsemicro.com>
Subject: [PATCH RESEND v2 1/4] iw: add ieee80211_freq_khz_to_channel()
Date: Wed, 18 Nov 2026 12:07:35 +1100
Message-ID: <20261118010738.1353183-2-lachlan.hodges@morsemicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261118010738.1353183-1-lachlan.hodges@morsemicro.com>
References: <20261118010738.1353183-1-lachlan.hodges@morsemicro.com>
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

Add ieee80211_freq_khz_to_channel() so S1G channels with a freq_offset
can be derived.

Signed-off-by: Lachlan Hodges <lachlan.hodges@morsemicro.com>
---
 iw.h   |  1 +
 util.c | 15 ++++++++++++---
 2 files changed, 13 insertions(+), 3 deletions(-)

diff --git a/iw.h b/iw.h
index 01ef3653f2c2..2155b8d20468 100644
--- a/iw.h
+++ b/iw.h
@@ -259,6 +259,7 @@ void print_iftype_line(struct nlattr *attr);
 const char *command_name(enum nl80211_commands cmd);
 int ieee80211_channel_to_frequency(int chan, enum nl80211_band band);
 int ieee80211_frequency_to_channel(int freq);
+int ieee80211_freq_khz_to_channel(int freq);
 
 void print_ssid_escaped(const uint8_t len, const uint8_t *data);
 
diff --git a/util.c b/util.c
index 11f8117d5b91..64bec12487e9 100644
--- a/util.c
+++ b/util.c
@@ -197,10 +197,14 @@ int ieee80211_channel_to_frequency(int chan, enum nl80211_band band)
 	return 0; /* not supported */
 }
 
-int ieee80211_frequency_to_channel(int freq)
+int ieee80211_freq_khz_to_channel(int freq)
 {
-	if (freq < 1000)
-		return 0;
+	/* Only US-2020 for S1G currently */
+	if (freq < MHZ_TO_KHZ(1000))
+		return (freq - 902000) / 500;
+
+	freq = KHZ_TO_MHZ(freq);
+
 	/* see 802.11-2007 17.3.8.3.2 and Annex J */
 	if (freq == 2484)
 		return 14;
@@ -222,6 +226,11 @@ int ieee80211_frequency_to_channel(int freq)
 		return 0;
 }
 
+int ieee80211_frequency_to_channel(int freq)
+{
+	return ieee80211_freq_khz_to_channel(MHZ_TO_KHZ(freq));
+}
+
 void print_ssid_escaped(const uint8_t len, const uint8_t *data)
 {
 	int i;
-- 
2.43.0

