Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.182
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795290280;
	b=2kp7AvD7IhXDxCyB/Ws27nWTs2f7pS8xJi/TDEFxpm8o34jsOoVuLZXB1Q8y0CteG3c8
	 8cB2o9ftP04XTO/PgcEr9Xc+Ja8gpSuVWx5+HZ0c40HprsGtKyZ6VQwOuglga63iSGeuT
	 5jtSOovEUkM6xmeLafUEni/BdgnFVsrTrtZY9DhIaxmJ7rnDIq1lZEZ+Z+u08GconEHln
	 TV0H1xEUmiUH/RAItue4x+k3SirWK/92/RBQCLcMSETp2dkLqflriZXTvJgKOs6kFr0LX
	 gTDjVRTA10q91K6St2KeyZMqRp1tGsct4KvwYKb9huR/gpd71Egz9vM6jCOgDkgYxSA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795290280;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:MIME-Version:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=qgjW3OSQNm9Gwip+HscVvsH2E1ufxmuoFiMBOQ8sMVQ=;
	b=egULm5dV36fqtPf3e11sdF3kRw8btHf4MNSq4xsAyveqQHFvk+Jlalrp5UtMDFoMNWnp
	 Dby0YYIZ9vymGFQ7q1gctepsKjQqU145T44dHOiLGKw/3nChnNVWhdDNZzkzKTNj+91mY
	 pDpf7NjhwCdyHzpTw5BVHrTwdbehzE6GB1Sv8Cllhomk6mCed49st3rAvb2FYtsjmORIH
	 LVF+OgxgbQ70oG7XS4KTcdfPoMQBeyXCWRRWyMZfkA4r2R6QQg5/fWv4LmzBCEreRKPlk
	 YNStenTLbXua0a2IZbeOsKUIIDSCuvc6AXLAkHw/IE5D6yRjNbgk1Bd3IuLNbPccUXw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xr67TbNO;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.182
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44E63606A32A
	for <linux-wireless@vger.kernel.org>; Sat, 21 Nov 2026 19:44:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 44E63606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xr67TbNO
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-8b10d24345dso18059347b3.3
        for <linux-wireless@vger.kernel.org>; Sat, 21 Nov 2026 11:44:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795290279; cv=none;
        d=google.com; s=arc-20260327;
        b=GzGItYCjfzqsxLKZah2QYnpfcpJTwUUwrcI4McNsKBcCwk7BI947xT/cp+yw/TzyqD
         i/Ia9FLBI75g21cJ3MTsBLAvjyU3AEywiL1CTDEZiuzk0XUlLZzXw5sOKzrjVPN75zdD
         aijDVNwijHGCRJoV63xb8B0sxHDFjRhZPbZJBjnkqml1cLle5+7RcH4owUDxtv+O+h0L
         Efmy6Rr6S/pf7DYmWIh5ViF5psdrwwE79WADyLcfbGLseFDK2Nx3bxem83+vhGjHZjVc
         Gisz/R3QnVzpEHtc4ZZnB25ukXzmcqpM5V6lhYkRZ/ZjJgXT96hPkUqkd0MnlkzNBMRd
         g6GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=qgjW3OSQNm9Gwip+HscVvsH2E1ufxmuoFiMBOQ8sMVQ=;
        fh=5M6/7fl2V+DMYtcpJS4i2wKNrWn0btcxkdyo/9VZQMs=;
        b=pOucWoP/48cJoLYDZv5GzOhBeW11LD2vJrJgj6D9RZte53k27KOs551WKkoPMwMq96
         8jMsmHkSaoUZKFoaluf1aaD+AHSL6ZxY/gBUvs2rkL3CbDV2wphgxj6t4Nei/iJEuM0q
         S2hcu4cypdHM5eyGt21uWVMlw2b0JhEFB4wDHKA0cy/INBfFUg/VMO4HOx91oNuGpsqu
         rFncXphVsk10etRelCY7KDE4VDCdwuG68fiwcdm6iXnSIHJl5/KbMTSl5RO4TT073c5O
         MDkyigShYIydTVPKi2/qW4zlOO4CBBxPCbJ+Rc8STAgDXCGx9XeBkHgtCq+mKVg4VNX+
         AqMg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795290279; x=1795895079; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qgjW3OSQNm9Gwip+HscVvsH2E1ufxmuoFiMBOQ8sMVQ=;
        b=xr67TbNOvrfuVw/L6CShYDyU1XP0ENSQww8I9YbJvjLYsMXvm0a33/YdE+8UNQwavx
         msqo1rpE6uxOnY7jVmK/c0W7xvEWwss0GWR5IYs4Yrn6r1JNOV5gEbgPS5ZXP3mRG5XF
         gpcV4qVjNhKvjjPLcrpYHOuT700pON5PiZywIxBOskETSSDLtjC6uAgJqA78j5QYT+Ji
         gxWJdP4ZFdSqmTKEpnu8/2gJ5g6He16fN/pdyjPdV3zGuMKaNHZ3rhDybictdk3HHDL4
         TEK6jHBHT/c4J+Vl+OHAzUMIbcfKbNEo2R3pXTxbmMCkl3donZ+fKI0euS2ZLJZ2R1By
         Af7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795290279; x=1795895079;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=qgjW3OSQNm9Gwip+HscVvsH2E1ufxmuoFiMBOQ8sMVQ=;
        b=wpr6faymugGgHGQH9lwwx2RrEY8l3wHIoZfA1BGUQwAZ2IabYGEN1IU688C3xTt/l8
         jfJwX8G7eTYXl16J9iFBSvkybIlHxwcL/ma/TMXKjz7LcyYudmwHfJ9TJ4wENg0WQLI+
         ImOV/Um0wcBOdFa69HHZPISq5Ay/2MxhEBWhFkC57V6Lwvia7LmZolT1wrhTFxWqnvRU
         7tf1GP9bBs6iWzpVva1CxfzoQzSi+w81l6bFVsOGJzukZQQZN0cOCmUBmrJOboXlwOZC
         Zjmt3ISYwwtdI1a1cn9mTObXWFf5VHkA4V+i80NFSToifPrrg3wMEzIOihbqmECIhYjv
         SlUw==
X-Gm-Message-State: APuU4Z/DjS13CREf+GS57y8D8qMh/aqgF2A1hqInE5NN7lnLrbuRdiyu
	n7eD70YrKHFuequuLSnhQRY/ZhK47hUga3ka8WzOxVHrII1DMtP4vWrDXBzU/BOYVGy6AB5LFTC
	5y4F5zPmxaUrtGtcKVWNGQ5T+KS+5Ld2G
X-Gm-Gg: AZFdTZfIagbooUePSEwRTeUfPTPuBfpNU+7cQNKXjN/nlSAWMGaQ9pJhHFtdj2raC7j
	SulQeqJFdhmCxIBOvzW+Crfsud8vkksf/c+iqFye6rCqUPDU6AV26lxGqxh7fR6sbaXrr5eM6LY
	OBkSNjHW7w7n2Wwf/zdp4aiQe/YS5PxQBnHfnXv5bGGE71cRAPC6rYIN99l4dx3qJs20jgr9Nig
	uTz1calECgr5pdd6FK7xTTmvA+1P3p6ibVm4iHb0/XSu/RZUBXglFScafmaVXbvXrmozloGMBLy
	AvIeHsJhGqOHWyztrZ5TrENaSEMVneWd7HY2DZgNNDzuoMx1Vx4zXpaRWtKiJc+4pJO55YlG3b/
	kaByXjbLL+4E8lpAXw4Q80dTUxrKz/FnfSegtTy8oorVAqMpop49HEZn3vONSnrNZbEpssdBGAE
	4ROjLhwOTJdRVbohDu9KA=
X-Received: by 2002:a05:690c:6285:b0:8aa:5af3:e420 with SMTP id
 00721157ae682-8b5204403aamr33356447b3.11.1795290279137; Sat, 21 Nov 2026
 11:44:39 -0800 (PST)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Sat, 21 Nov 2026 11:44:38 -0800
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: =?UTF-8?Q?Alejandro_C=C3=A9sar_Cosentino?= <aces.cos@gmail.com>
Date: Sat, 21 Nov 2026 11:44:38 -0800
X-Gm-Features: Aa3M54q2j_BxeN0QOeOLiirYr0pDEQjRisVJl9gAzF284EaeewVGzT1WwOFMyp8
Message-ID: <CAPQxSbui+QR_yhwCVmCPmKzcGPdVpW0kVasF_QGV7Ac9wfyKXw@mail.gmail.com>
Subject: Re: [PATCH wireless] wifi: iwlwifi: mvm: fix self-deadlock in WoWLAN
 key programming (Intel 3160 case)
To: linux-wireless@vger.kernel.org
Cc: miriam.rachel.korenblit@intel.com, adisveletanlic@proton.me
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

I am reporting a possibly related case on an Intel Wireless-AC 3160. I
found the patch "wifi: iwlwifi: mvm: fix self-deadlock in WoWLAN key
programming" by Adis Veletanlic:
https://lore.kernel.org/linux-wireless/20260927-main-v1-1-660ffbc9837c@prot=
on.me/

Hardware: Intel Wireless 3160 [8086:08b3] rev 83 in a
Pegatron/Garbarino A24 laptop (BIOS 208).
OS/kernel: Debian 13, 6.12.117+deb13-amd64 (Debian package 6.12.117-1).
Driver/firmware: iwlwifi/iwlmvm, 17.bfb58538.0 3160-17.ucode.
Wi-Fi: connected to a WPA-PSK network; WoWLAN magic-packet trigger
enabled for the failing tests.

Observed:
- With WoWLAN enabled, a pm_test=3Ddevices run failed to complete and
required a forced power cycle.
- With WoWLAN enabled, a real deep (S3) suspend also hung. The last
recorded kernel line was "PM: suspend entry (deep)"; the machine did
not respond to the power button or the scheduled RTC wake and required
a forced power cycle.
- With WoWLAN disabled, short and longer deep (S3) suspend/resume
tests completed, including wake by the power button and RTC.
- This Debian kernel has CONFIG_DPM_WATCHDOG unset, so I do not have a
blocked-task stack trace for the failure.

The proposed self-deadlock seems consistent with the symptoms, but I
cannot establish that it is the cause on the 3160, and I have not
tested the patch on this laptop. Is the 3160's firmware expected to
take the non-unified D3/D0 key-programming path fixed by this patch?
Would you recommend another diagnostic before testing it? If
applicable, please consider including the fix in a released kernel and
stable backports so it can reach distribution updates.

I can provide further logs or perform a controlled test with physical
recovery available.

Best regards,
Alejandro C=C3=A9sar Cosentino
