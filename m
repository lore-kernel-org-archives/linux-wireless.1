Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794918411;
	b=aoz8FF2UJx3qmJp8Mxl9OXWe5oAcUFVgA2Z5Fb7mwO1AeAem+NbQKTSUnhlxvK4jyZVf
	 mTaqdS69a4dpEU+jHVqMNz66ir4Qj2UvPTL6IGnS1xDkA9wM5XYg6jfyMBQpU37AmP+HJ
	 fEXQbVY933+To9NEP1Et+xex3qxAaAdT/Nyy+YkAkQrY4cqjhTezessDGz7135jQ/D2nB
	 NKWV6WuUaxRg7/MG2uG8ORxNUCfZzaDRtaq4FHfUTPRBcEQsntkpsoVH1yVO3V6PZYTJh
	 tFIWzcGbeSW6o2cIb2PDYcO1aK7rKWTZJBOx14dmitfXoTB+intwf1gXnKvEA3eS9qA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794918411;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=O0O5QnW9444oDYOMuHq6ymaBPNXYeEt/n8ZpeSe0y6A=;
	b=4JYPRLAmoaG8ZlLAQApUjPKWq2WkkbqKhoHDvjNeLh1cCqm+Ybtr69qz7QJV70XiE/aB
	 mGwjE292dr9FrdnKLpbb9cxfhZ8NXf05U0MtShSOVF+CQ5lH1Apn6ODb9CcJWsvJFNMKR
	 TS/fDsAzwBFbIMHsm6EhGzAOnJVF7js0Ui+ZR2Fbp0xB5D4hHOdOnK5MSqZs6bhKQcii0
	 HSb30q3G0Yk0Pf4WXIB1KLHkl75d4vBRE6QywAW6EY4mk8qgY4DEt0NpaSuMcfgazitXs
	 zjGJ0Qx8OAwcRbJuIaW1qCB+7irIFOzdoORj+6IBWcLHuEeUZJDRVqurwuXChbE28+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EmV7o2sM;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EB18606A323
	for <linux-wireless@vger.kernel.org>; Tue, 17 Nov 2026 12:26:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6EB18606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EmV7o2sM
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-4a33359c1b3so669071f8f.3
        for <linux-wireless@vger.kernel.org>; Tue, 17 Nov 2026 04:26:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794918410; x=1795523210; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O0O5QnW9444oDYOMuHq6ymaBPNXYeEt/n8ZpeSe0y6A=;
        b=EmV7o2sMw8zLM6Mk9vWC4ydcQmpstfNzFWT8TIlmEqiAuNzaa8OOFUeq/p99z4zf/L
         CTN31nK7nbWPjsNUWy5Nxe3xWqx1PSfXblVP2lGfOEsVTeINPmswlmXG5MGFfzLlhGpl
         PQA5opqDFQceDefBdOKiHuNLVPy0Bs1bHzn2aDQQVeZiEF9nJnZPvJxJx4eidmMtEEEJ
         mpNQMZ5Btkoql/paSHb/TCnPAS65Sfq5Rv0TK1c4PNysrZJJz0YMMCjrdxolBCZ/xoLS
         XIfhu2j7EPIm4OOJPjkCelNZtmn2LJUgKLrFMwrnOcsLXyYSlyL2R2F4y5keajo5A0kU
         5JIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794918410; x=1795523210;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=O0O5QnW9444oDYOMuHq6ymaBPNXYeEt/n8ZpeSe0y6A=;
        b=CarIMGGlXklgNoUIrWlePQfTAPcF6IaNGXMqS4QEFCTJDFsQ6WcJUq1G9csXGLnm4V
         Y1YSwImUDsgB5RRGf0UUB1+TCZPjCsEt6SzNlc+4s3lCQuQSuhNY+Fdlj7V4CgZ5dNqh
         pyVbPlkBemPwNVOTrGQDR8Ldx8HyBgIgHM7ApVZNLiKhQq8/GgHCj1RUY4bu5bUDRBdq
         tpo0uZrOV4hQ0kT0EK2sQwBhuE70HNr2FRk8z4gjAEK0Ca7DWsa16XCV7jCODSCs9X10
         s9gMHelyfJZu5rKY3Bst8M27PwSm7n8WoxjEEoSv+nwtnlL/Sg3wa/4XKhABQK7UjQJQ
         EduQ==
X-Forwarded-Encrypted: i=1; AL+hErH6efLCPxBLY4R7gHPHRgmKYjJh57Y7jVSEr+68FVlew5h9plbnBr97HP2Mk0bEJgvIcRtoGLLbx6HnH4gzJA==@vger.kernel.org
X-Gm-Message-State: APuU4Z8Y4IInS21CWekx0qJ++pDQ3fr5UojCNjOQdcFE0ZFWA3vSIAim
	xrRIp1JDdw1Xk1ZforF6udgKhe3LscYaEhRQGEuRGOaArGq650Nv4GBRlkyCa5R7
X-Gm-Gg: AYBFou0dAwcvSvmKcb8HRtzIZfOomXXbWPukJm3XEVPfWxGYQfWq7ETIpx5A1T8CwGd
	UD00VmE+6XpH95dOhRblbIuaGK7nzIcYpVZ2qSStEq6+mf/yEaruBPjJHkNw4mfOiITKBHZJOOm
	TqQde7bM/7N8EPrw9rME/FT4mJXKWIduLcslWlxMVlnruQuNAs/Sq4OQ6+7IfeOOmu/KUIwfzTQ
	BGbL9liaAJV89g6LcwpGoSYZeVdPWl0a2w2YfF9JOwMTH2cdBtjG++oJMkrCi/CVRRp7mYos50Q
	A32SgNelXyVxBW0MYfI5BxGSgJqfoUwBwsgE/IEWJaFvUznJMYf3IFuM0RBxeCRnUNBK0rVA+8n
	5GrHLbNxie0JFHV2NiY73Z7LXDBX81CN9ftm52j7qVfAnwvo2xhY5FlJIvXgTjhkM4whSYSctYD
	9h/MlP1z6PVOM7FBIAyWkL1xAXHKHpFugofG43DeXKiLqyrS3AVqcUFlAF3UaZtaCNRnx3RGE4o
	z6IkoYSj6DxDCMhg1YhYE3sW6lB8hBllez+c6S4EtteUzRiu/2TJoGv1psJniOY9arAdZbF9S/p
	ZkxEW57v9pUnvctZfoese/R61itzTLmXpBA=
X-Received: by 2002:a05:600d:82c7:b0:4bb:69f2:87f7 with SMTP id 5b1f17b1804b1-4bb69f28901mr184215535e9.18.1794918409634;
        Tue, 17 Nov 2026 04:26:49 -0800 (PST)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb783853b5sm66458935e9.2.2026.11.17.04.26.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 04:26:49 -0800 (PST)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: =?UTF-8?q?Toke=20H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>
Cc: Chun-Yeow Yeoh <yeohchunyeow@gmail.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mehmet.fide@screeningeagle.com
Subject: Re: [PATCH ath-next] wifi: ath9k_htc: do not fetch the beacon of a finished countdown
Date: Tue, 17 Nov 2026 13:26:48 +0100
Message-ID: <20261117122648.1731207-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <87fqwzu54e.fsf@toke.dk>
References: 
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

Hi Toke,

> if (ath9k_htc_csa_is_finished(priv))
>    return;

That would skip one beacon at most. ath9k_htc_csa_is_finished() clears
csa_vif when it calls ieee80211_csa_finish(), but csa_active stays set
until the second round of __ieee80211_csa_finalize(), after the channel
change, and ath9k_htc_set_channel() turns beaconing back on in between.
The next SWBA finds csa_vif NULL and fetches the CSA beacon again.

On an AR9271 AP, with a sniffer on each channel counting CSA beacons
heard on the new channel, in 120 switches: 3 without a change, 5 with
the early return, 1 with this patch.

The one left comes from mac80211. __ieee80211_csa_finalize() clears
csa_active before ieee80211_set_after_csa_beacon() replaces the CSA
beacon, and ieee80211_beacon_get() still counts that beacon down, so an
SWBA in between passes the csa_active test and gets the old beacon.
With a print added: 3 such fetches in 200 switches, the same 3 beacons
on the air. ath9k_csa_is_finished() has the same window.

Dropping the csa_active test here would close it, but
ieee80211_beacon_cntdwn_is_complete() warns when the AP has no beacon,
and ieee80211_stop_ap() removes it before beaconing is disabled. So I'd
rather fix the order in mac80211 in a separate patch. Does that sound
right to you?

On csa_vif: remove_interface, bss_info_changed and
channel_switch_beacon all run under the wiphy mutex; only the WMI
tasklet does not, as wmi_lock is dropped before the SWBA is handled.
250 back-to-back switches and 25 AP stops in a countdown showed no
problem.

Mehmet
