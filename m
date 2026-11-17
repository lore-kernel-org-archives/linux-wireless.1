Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.228
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794917575;
	b=YnhIkioYKID3Lm5bgsGH2lReEMDxP7gJixoMpo0Yojz2IcTqv0fh1WLAzcVaR3tYEqfw
	 +5iP4ErYanz5CPZXTBKF1uny8atNlsJXyXGJpi1ogkJh//eIidq2co/lLZsdKeMewF2cI
	 o4MdsGW5eGGMqme3+kv2CrjuScsEThba1sImKJJ9aebZaR6V8Kwsl8Hos8szPeCSvcPHp
	 zQsXCWFNw4Un0C6aKT87fO9ETfX9pjMD0KC3C7eBxHxz9EzN5uDU8kSg3GwUdOlb1wZR2
	 iztJ5enD2VS5wi5qW9nTHPAymWLrmk8OKg1FX3DL4HCGGIygYqlrmo14gLGLo81SV2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794917575;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
	 DKIM-Signature:X-Received:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=SSx5wIgosY6H9+fVRqrZZsSZ7OrTMTUpB4OQbwOFcCI=;
	b=o/AplGdZAqshpKaHB1JkV+Av+8ygQWIVAyCK+CDm4FXiQ1VgifNBU+c4o0we3Cpmyfoi
	 sRFGITBJxNiMjMF5N87ttFULVE6AZ0J+8jhRNeVrYayZ3dNthtOh9LEQuqr5bHet00bkL
	 yvCw5Tvs/ex3G7O4giIVjQhlhymK45p4NsP3d+TDlSJvI5cy9s8hUjj7JTDZ9qFteYfjR
	 L0ZAn3bMHpJN24B1w6DDkWU24lpDgLQHBdDULJa9m06x5DiYkx1qeTwUjv9Xmv+UOocuk
	 uMdRrfNw1bjHVo5/BNSUJ4bG9+sjzyz/oxkPzodMrw/mDoCvXD2gG4XBZQUKPxz5p5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=M3Y08yYK;
	arc=none smtp.remote-ip=209.85.215.228
Received: from mail-pg1-f228.google.com (mail-pg1-f228.google.com [209.85.215.228])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F28E606A329
	for <linux-wireless@vger.kernel.org>; Tue, 17 Nov 2026 12:12:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9F28E606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=M3Y08yYK
Received: by mail-pg1-f228.google.com with SMTP id 41be03b00d2f7-cd69954c755so3857631a12.3
        for <linux-wireless@vger.kernel.org>; Tue, 17 Nov 2026 04:12:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794917574; x=1795522374;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=SSx5wIgosY6H9+fVRqrZZsSZ7OrTMTUpB4OQbwOFcCI=;
        b=T/3sTyPzd/S97kalnWQcvbmd0mbJgDusPHN8K+ODI9+VacsZHBgFzoA2o9yJf7lild
         I6bB/38l15q2jdBOQTwf5EsGiQcgxi8OR3hy3eCJOBozySeDm5JMDIIF1HMr5zPP+AGj
         GHxkEXw2QDOkX4V8/fsfhss8zf3iynkjTnmirmOPFOaEGVTA8GH7tptlUj/LsXA4te91
         VsY2hKdet7EHITqelGUiTHZG7wQiA47WSoD9ZPIh+tlAE0QqJpiTF+tvqgJUMvdoXqCJ
         4inakxjZJd0+1pyTg/JJbBeL41hkPQvAp6NxkL6g7UPaG+9sIhFyMk5GF0qZ4aEgrtk4
         jb3A==
X-Gm-Message-State: APuU4Z/pqIcStj/X84eMweXo3nKQpplMtI0ikbKIhunh3FBnoURE1Ulv
	pfIthSoPx3upZhFcybls1c3aRTZu7VXrrwPLhB8LcRHfn+dfhWHB8PNLiGvx4WrefapjNLdLxWw
	cwin5Ww/GbB5j8b8hskuwtpNJH6IIu/k7N9F84+fhcq2dHF/FTM/CkVdPruVASXHONc9mYvlC/l
	4uLepsL9kXMXXPccOA4EvhcWFCDeJWQ5I1GpQ2a71jdcMNE0n1PpoMUTRCPNLNDRxxx4n3oxlWm
	X08cTNc5RwFadM5Qp/NrYUwfcGN
X-Gm-Gg: AZFdTZf2HdkLt6nBds7H35UvbRPasXkaWKMBA7ojY6Oi5ZoJ8ph7a23+X6l1nMnsqtS
	3Y9aPor+YLGmU7nwJUwPu/py6mpC5DK/4bY2WdPI47g3uiNXEA2sPx83cQ9WGxs+Hx/CSRtfS5S
	cvMeew/k00cHTwd/FhsxvfKHVZQFZIogG/1lcfxJK7V1IygLaOWWRjYd6fXZmY1gOPXtm5hiLEo
	3nwDpIxK8wVjnpORxtDVrfJKc50hgNCnit0ZoU/oV4TzzhT7bCQe4ydce9dMOS6Niqck61P0J4r
	LONJsCaNfdEyExQ7cto9V0YGtVBdeFKXLeHRz2noKulbwDtOJYfh8wPx7qsWWY3eHqMZbvgt4/W
	GuPXnqKFHwvVRVAU45Qi0GuY/5agJLxjpX6lejWsoF2+xATtydp3+1YHhDojgT5mlllHE1hHUJD
	ayNinQGAPU4cU+axXS5+Cs8q/fx3VsDwqvCnnCrFcq2Q==
X-Received: by 2002:a17:90b:2f08:b0:3b0:9a0d:b825 with SMTP id 98e67ed59e1d1-3b1b0a3c10cmr12891423a91.45.1794917573827;
        Tue, 17 Nov 2026 04:12:53 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-123.dlp.protect.broadcom.com. [144.49.247.123])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b3abe7d05bsm1889024a91.6.2026.11.17.04.12.53
        for <linux-wireless@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 17 Nov 2026 04:12:53 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-4a3705ea6ccso804430f8f.2
        for <linux-wireless@vger.kernel.org>; Tue, 17 Nov 2026 04:12:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794917572; x=1795522372; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SSx5wIgosY6H9+fVRqrZZsSZ7OrTMTUpB4OQbwOFcCI=;
        b=M3Y08yYKCSjMAv9g2RT+iASWSxNSIDU81eGC3hOW/4yu9wLHIqbGB2AJBIfpSss5Xh
         SoMPkyqW55u8jugaDKbcKJBN9LiHF+lrDrqQdQxVmKDXAsvcHpNmRPuVombGDzQOsU9B
         Ckc7d6TpcDL7kXTCeW0yR1i03JcuTDC9KNvfw=
X-Received: by 2002:a05:6000:22c2:b0:48d:ecba:3cf8 with SMTP id ffacd0b85a97d-49c741b1331mr31821692f8f.43.1794917571814;
        Tue, 17 Nov 2026 04:12:51 -0800 (PST)
X-Received: by 2002:a05:6000:22c2:b0:48d:ecba:3cf8 with SMTP id ffacd0b85a97d-49c741b1331mr31821633f8f.43.1794917571373;
        Tue, 17 Nov 2026 04:12:51 -0800 (PST)
Received: from [10.176.3.187] ([192.19.176.250])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a3d39b8a37sm3709465f8f.46.2026.11.17.04.12.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 04:12:50 -0800 (PST)
Message-ID: <b8ccdaca-ce91-44f9-925d-eb5ef6b78088@broadcom.com>
Date: Tue, 17 Nov 2026 13:12:49 +0100
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: brcmfmac: reload the firmware after a missing D3
 ACK
To: Andre Eikmeyer <dev@deq.rocks>
Cc: linux-wireless@vger.kernel.org, brcm80211@lists.linux.dev,
 brcm80211-dev-list.pdl@broadcom.com, linux-kernel@vger.kernel.org,
 sebastian.reichel@collabora.com, Lukas Klizas <lukas@klizas.lt>,
 Yossef Osman <Yossef.Osman@proton.me>, Aditya Garg <aditya.garg@linux.dev>
References: <20261104151616.70623-1-dev@deq.rocks>
 <20261116110839.4481-1-arend.vanspriel@broadcom.com>
Content-Language: en-US
From: Arend van Spriel <arend.vanspriel@broadcom.com>
In-Reply-To: <20261116110839.4481-1-arend.vanspriel@broadcom.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 16/11/2026 12:08, Arend van Spriel wrote:
> Thanks for the patch. The resume problem is addressed by Andre Eikmeyer's
> series "wifi: brcmfmac: pcie: S3 and deep sleep on the T2 Mac chips" [1]:

It is all you ;-) so you can probably confirm whether this is indeed 
superseded by the series mentioned above. I marked it as such in 
linux-wireless patchwork.

Regards,
Arend
