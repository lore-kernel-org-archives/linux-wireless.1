Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795790655;
	b=fu1WnMBT5aFLF8nBJyeLACQbh21ND/7ThomIxkg5KMnhpscDJIedHJckp0E/qUn1g/Am
	 ui5ccKKRWixbhDxfAMcY0Qn/4Ihqb+HnzNRPeKI6kq+/6U8h37HvzIsBap0VTS6vep7Ne
	 bm5ajmaAzdttAVKi00U8mcpvtFme2/mwNDp16JktCaYBvq7s0gC5wKq8fPMGXAD7UAUAw
	 hzBzBRUl5Mi/SD+rp8z3vTGSq6M4TuCjBJEs3HVwRwgvRcLMrFmIl1mvCtSs21u/fpRpj
	 M9TbcR/+Oio8DjqLb7O8DrTe98kt2+UJgx6JFmoHNcqZ7xfZtKx0czUi/9EcwhPUM5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795790655;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=bLfqGa2zdZflECgOfA1nbN49Q1BUR/Jo94N3aWX8IN8=;
	b=ZmEnqVdhtomvzQR1Au1Z8NlOaw2ZhbIw4Jmhn3i2AjeMRE8ZDN6XrXiAmAw7EN3jb7Id
	 eu5wt3TxmtGuEUTGdKsstVvVRs/LTzVtVaRI66A985Jj8xKjAY55sawo5kdNIfxC4vunk
	 iXgdFVQN+0CAWAiezE4842KM9ZNeIDeEG4f1TcWTFgsSUYeirMrbYKG9u2d6HxbH7QeFE
	 tfMWrrXZiQKCy5lhyL7JJaFyBB84PD+Br87aRfNL+NJwI8LNv37sKVMYDGoONSI+C0xVA
	 qEeq4IakAXNND1ENH434GpbSpYBWlQDAd78aPoYBNf25sXlGPuDds5gAWdEUrMib0yw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0GZBqAzW;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49C3C606A332
	for <linux-wireless@vger.kernel.org>; Fri, 27 Nov 2026 14:44:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 49C3C606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0GZBqAzW
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4bb6057b333so40145615e9.3
        for <linux-wireless@vger.kernel.org>; Fri, 27 Nov 2026 06:44:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795790654; x=1796395454; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bLfqGa2zdZflECgOfA1nbN49Q1BUR/Jo94N3aWX8IN8=;
        b=0GZBqAzW3F3wkYK3rhjDHeSPAAp+xa3nb+Brc9xrnDlvZTv2R3g/pyFOMIbgnDc1k4
         FdPRjPgRyx/QrbrBPKl9lDLXX3Dio/CJT/IDeKF9VLGsGm815oV7ch6jDKX0P/Bcm364
         ynWLZ1lekOdrKjJZ1++AF4OhDnSatKWC4CR0VdWRV9Cf/knx8AN6Gyz7lkCR5tEw3K1j
         e44j4g7+J1jBK4ynMjTJrL1uAwNheFsB2Y0N5IZ9aLAqqwPDnFIPssOMc/JyuG/oqV0p
         lDch5Cng/RGKItC1ZzVGQn4ttjvBPRKyfVRlALlZ8Wx/5g39eSVZyahfrHgvRRbsIShe
         6p9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795790654; x=1796395454;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bLfqGa2zdZflECgOfA1nbN49Q1BUR/Jo94N3aWX8IN8=;
        b=sJyDh4eg7Tv0HURns7AW4YPriszakb8LXKIhoMPp9mk/hcGZAxlPuN+AEc8btOpR7E
         uU08MmxNZx3nQoD9Ho0btgn+sPGcih2gU/VSfFGGYWrdCrshyoITqr0wfHaxXgQgbMiZ
         hIwRCdURcCEeH47WWOasZUKD2Lfw4meVfwXrAhmZtPcVuC5XDfLr0ZVQ5jQ/Ky0zts5B
         OmovtgWvkzio4lqS9zQY2y7aUwTPqdEqIsNyc9IKLEZebOPHbZNwXRuCV5cL/O9UxS78
         0Wio1budHSwfYyw0+/PqAbnC7cbztZEt4AH8zYcn4vpfIf4YZt0zeuH0a3cNCC8YREw0
         BWrw==
X-Forwarded-Encrypted: i=1; AL+hErEkHPQU6yP2XsNOvZt2FgVxNe8tMfnnoTjyH0kqCOJq6Ug7OlLLVNnnZ3mOZyHF4hLZnwFOGHs+ka+coUIbfA==@vger.kernel.org
X-Gm-Message-State: APuU4Z+tRN2dug6XxgUXCU3qSvSBclPyTRZH6oj6jqBm/8lG3pphl/QM
	xI4kg2vc/+FH0Gflp42Z3voj4Fn2ydC55EpwRWELHo8oMA6ojeAFSnhv
X-Gm-Gg: AZFdTZfaCAMcKSldHtSwq4uR4Ivd5JUhXy8fOefAGVokJ0cpfxjDWJ6vOJyQPXaoU4P
	t+hySLGdWsNexNki2UmmQTn/Oz2tgyNimZXAmwqbuL/RQpa3LKh+fMiJSf1KsVdAyuuV73+Yp/5
	j6WMZIUprIOzDrR9pGNgepV8MrUk88BUNaKgY1WeqYeddn7yC8qNw/At/vFju7VCJHxq3/SAoce
	EV7trJXWIR9qY9uE9jrEAt0DREeoAN1ZdQbNu6e4gy5zR2Hj7m3ITm/h5aFgFkXMEGYBduMj8Hw
	TEmwDNreJjGfAVwxjKYkxDcpa9dZlyXpwjR4B/uNrTaFGG/K3ZV2vAp1vqhIWyKgpTwRQImm6Uv
	VwkjRK2tp3Ig7LCVG9bd93omkLBHwAj9HpNjhoZmR5FcKd0/ja2oPf7aW2QkzeUX9pCQbysm0nQ
	OyQ/E1/NgiC6L9CFHSrIQW7Uk0rcnYUPDmp/lKslxIqaPY4T8UXceYV2Znc3azACLTIzK5Kwa02
	mdP3vumDFXoOtHjuEg51BNAwWtrvvEuMZR+jdTcbvBvId/aG8lDXWtyTWAWGQJzFXZW1UHOIFIk
	i2pTnFe0e4j65Et+lQA3IP2YgGhlrko2TeM=
X-Received: by 2002:a05:600c:a085:b0:4bb:7bee:5496 with SMTP id 5b1f17b1804b1-4bb8880f04dmr525787245e9.13.1795790653602;
        Fri, 27 Nov 2026 06:44:13 -0800 (PST)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb9065744esm379720835e9.1.2026.11.27.06.44.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 06:44:13 -0800 (PST)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>,
	Shreyansh Khajanchi <hi@shreyan.sh>
Cc: Jes Sorensen <Jes.Sorensen@gmail.com>,
	=?UTF-8?q?Georg=20M=C3=BCller?= <georgmueller@gmx.net>,
	Bitterblue Smith <rtl8821cerfe2@gmail.com>,
	linux-wireless@vger.kernel.org,
	mehmet.fide@screeningeagle.com
Subject: Re: [PATCH] wifi: rtl8xxxu: Enable AP mode for RTL8188EU
Date: Fri, 27 Nov 2026 15:44:12 +0100
Message-ID: <20261127144412.1877968-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <f8385f6638854ee58f9c7204208be49b@realtek.com>
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

Hi Ping-Ke,

> > Do you think it is acceptable for normal use with these functions only?
> > For me, it is fine to merge this patch, but don't want average users blame
> > AP mode unusable.

Not with this patch alone. It sends 0 to 8 beacons in 20 s instead of
about 200, so a phone or laptop that scans passively hardly sees the
network, and in my runs a client in power save never dozed. With the
two beacon fixes from Georg's series (REG_MBID_NUM and the TBTT hold
time) there is a beacon at every TBTT, and a home user then gets:

- a working network, open or WPA2, for clients that stay awake
- slow links: 0.6 to 14 Mbit/s TCP. rtl8xxxu fixes the initial gain
  at 0x1e and has no DIG, so 62 to 73 % of the frames to the 8188e
  are retries; with 0x2a to 0x3a the same links do 25 to 40 Mbit/s.
  Station mode has the same problem today
- a sleeping client, such as a phone with its screen off, may not get
  its unicast frames, as delivery follows the frozen DTIM count: in 3
  of 16 runs none of 20 pings arrived
- a sleeping client misses broadcasts, so ARP and mDNS (printer or
  cast discovery) toward it can fail. rtw88 APs have the same gap
- "Failed to read beacon valid bit" in the kernel log

The sleeping clients were rtw88 clients in power save; phones were not
tested. So I would call it usable once the beacon fixes are in, with
these limits in the commit message and a DIG as a follow-up patch.

> Can you pick this patch with modified commit messages to your patchset
> after it becomes PATCH (not RFC)?

Yes. It will be the last patch of the series, after the beacon and
macid fixes, with Shreyansh as the author, the limits above in the
commit message, and max_macid_num 64 as Bitterblue pointed out.

Mehmet
