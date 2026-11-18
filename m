Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794988522;
	b=loEhJjDm2ydccmHcHDQY/qCAWJ454UWrowELq/9uQ4uWMvirx8V06XXuA4QeCprc0DFl
	 /3jgfY9JWqwjVO8qTA7TWK5cGDK9wrUou0KPA3sK9KokALqOF/SdHTbIot1i85qeuydQQ
	 t4WOmFwTOh1PA1O3YJjI0wy3AOT5k+RnA12h11/q36KSDBaDitdRpLV8Us4uVatEtTzg0
	 bxnb+hrqYRYRgnCm3X2Y071Tp+06mg+O/Yo+/lEjfq54JrmZ9uZMxU5+0FS6Bu73g/OIK
	 Vj+Iho7w4CfpqnAFEjou0B9bRDDY1SuLUJguW6gv54exUzLAK1Bz8Wzayo8BK2g/aCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794988522;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=IixbFQXdCcNRV05zhO0CILF5CYB7LhreOsOHyTa+xbQ=;
	b=niDdF9OGcUGIA1ZLfEnQXbKaeHxd5w3vdnWAhxp+XxucoaaP3u3e0O2cMrNQlFoT2SCD
	 WsOg6EVJOV5vUgR47hYB57y6NAsnyNApjTL4rZa1hb5kM4UrlzLBNAa/15wtNfLXVISX7
	 WIjMawcLDSRglB/UF9Izn7LzMuaa4yrzQwR1VLik7w70osnFzfmESnJ1tqkrl3HEtLIGY
	 zwIG5nVlGX3D1Nd+UL0Sf83dYoPd8dRCNJ+AoeqEEGSBdMEeUKHGrkLAioH7eAXjHvolh
	 lP39U8UeFQi3kDEhcItIXk7cM75p4sgKIR2hOamJA+sshYEXaqIdPK+TVwUKqlhnlMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZPCDWY5K;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A030606A332
	for <linux-wireless@vger.kernel.org>; Wed, 18 Nov 2026 07:55:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1A030606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZPCDWY5K
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a2153c8525so4683425e9.3
        for <linux-wireless@vger.kernel.org>; Tue, 17 Nov 2026 23:55:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794988520; x=1795593320; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IixbFQXdCcNRV05zhO0CILF5CYB7LhreOsOHyTa+xbQ=;
        b=ZPCDWY5KjboLv2qiUQJNLCrhqC0b2RJNEadIMQZ58PFpt3321ldzzVsvZzPH4eVXAP
         U3z1HuiF3fvO+h48mcpgMzs0HC650MBoJDLQ6NUTwzhuadeOeElBj9VpCc3FrnKAR5IE
         RW1Pf5c/skEH393lNme8Zv2sToN2m7cd261Ls/+7FKaeWPpbmc1VSDtpwiBGnEghvVys
         EAnqdmdtOJe6OQ1goXrBZUHqpCApIlegH5C98NIjrk/+2SExYNyncT8V/QWd7yVBhR58
         7fv5fzq2nX13eAWbMOc5srgfrNdS0oVRpvziEgkLve3vcYiV5/3i7i47h/MGXduqyMxA
         LZTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794988520; x=1795593320;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IixbFQXdCcNRV05zhO0CILF5CYB7LhreOsOHyTa+xbQ=;
        b=rqfRqfs/RgxPwcpTsd2oq4u1Tevx368Tn+fXnZ25JzBHC8TiXR5CZxbgUlKizYCpiV
         oqojgtVifBRXW1W4buM93HOMAnPzEHDKDAy8hI5GPe7Niwxh1ioU4hBPqYUCiqraqRE2
         3nVdXl8dXtRR/mPMD/3kooDzHjIgvpfdR8pFxLdIEVqbBH5Y/W2KzP9KZwv0iRvMR+Ww
         dJwKBy5xESS9xxHAR8pYzNubHFsaqLND8bw4EmmIZPNU6GRtKSEe5gajtxwh4VzV1cl5
         6oay7fVp9idLQSOcvZ7+/fgnYAOLuJBhcJpwq9OBILidSVvU7tPwtL95ARFfoqkazn/T
         Jiww==
X-Forwarded-Encrypted: i=1; AL+hErHGDYgpQPylsu95z3tx0i7Cod2NSijhDAbRwLMeN5UnxOjulErAwHCKyt3Sv+vmJ1govJ9MZd97AJX6Bt8nmQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z/S4uj+KrCJJLdFMSecryvbbClRul1oWnjO7o5sMxlzHsjF/qnG
	S62CfBaQrdMB7SLl6fUe//d7PpRWa6kpqNmvUss2y/ccgUod4XTr5LYX
X-Gm-Gg: AYBFou36c6VGkcbykc+D3cr+J6zPPtwkwTrl5/JrDl0CplOqbIlzIOPz+f5Li7sSBzD
	hbABaExzd18Lk5bA1TYfvD5beT5Ddcbe5SJiw62RRY7BHKOyVTX56Z6Zv9Z3+GrFJMBZ0qH/5lx
	OTWkz6s5cpnxHKqgBi4udSPPl0i92p55l9TVKyXNfzzVgD752vEeae7eveyrZBGf+MmB9OSpmWE
	M2f9Y8+6HiUqzv5StlzIrjtQw07we2ewDf1cMEMNlQ73bYQGEZnzDqLomW6rxKMtbscSmd4rdle
	FIrltX04ZA/lQNrbDH2jCtWdLdM11r53be8rvtoTD1mi9Eu+5kEonv/GHIsFWbvCgSq7vgHHC4X
	agA80aNPdoeTxkYvjkbUsdOw6IrRJfh/VOyQ5AN5TktNgTC4wt82L7eZf9qJZRSDvVUuAPMAhVS
	899cbs3xe2RGr0j2jpSCpvafWD53sS6+W1uaIr3hIpyjnpQOr97QDNen9WDrH7cF2Xgkzchx19o
	xmhqytcr+O6Y5NaU2XRh8QWE6+Aqw5/xhyviZ2uAODf+7BYQrCCYQ7J8U8j3dESO2A9IDCdijDa
	TaCwo4ArfRyAlwCVHULWxVJ3rPHDyfc1cg2Dy/okorX2rTxWmZPuoDhu
X-Received: by 2002:a05:600c:8710:b0:4bb:6fd3:5aaa with SMTP id 5b1f17b1804b1-4bb7d6d1dcbmr31055095e9.3.1794988520307;
        Tue, 17 Nov 2026 23:55:20 -0800 (PST)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb7e59834esm15865035e9.4.2026.11.17.23.55.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 23:55:19 -0800 (PST)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: Luka Gejak <luka.gejak@linux.dev>,
	Bitterblue Smith <rtl8821cerfe2@gmail.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	mehmet.fide@screeningeagle.com
Subject: Re: [PATCH rtw-next v12 2/3] wifi: rtw88: support channel switch in AP mode
Date: Wed, 18 Nov 2026 08:55:18 +0100
Message-ID: <20261118075518.1980526-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261117232624.1956815-3-mehmet.fide@gmail.com>
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

Sashiko found a hole here: if the download of the count of 1 fails and
beaconing goes off and on before the retry, as for an off-channel
period, rtw_ops_bss_info_changed() restarts the countdown with retry
false, and the work finishes the switch without the count of 1 ever
reaching the firmware.

With a test build that fails that download and an off-channel period
of 40 ms during a countdown of 2, this happened in 9 of 20 switches on
an RTL8822CE and an RTL8822BU. Passing rtwdev->csa_retry there instead
of false keeps the retry: 0 of 20. v13 will have the fix, please do not
apply v12.

Mehmet
