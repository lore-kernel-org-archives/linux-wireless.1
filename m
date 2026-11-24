Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.228
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795551221;
	b=NoCRiNsS2A2fe7YQeS2QaEw1BmCCZGaejmU9/5jF+KPOHLPsGTeVJEeGrLJ2d+eHFGlH
	 jTohaXfgcbSfjlBGjkLnr3YhBWVAOJjnivpMyiKiiIM6Hz7DXVoEGZ7GFhuippFdM+tqU
	 E1DEpCGwlzm23R3rbF8LnlXqBA72E6TfqCz5tPsgJ+ygn6E3fCfCtlpvwRYebcZHx+DyJ
	 rydKUlFfyeP2Jg3ZkbFHXbyREGpxBQuimMG9I/n3OPOsRPNXWmxlJwF877sbY/YErtwGY
	 0UCjeWtciCgPH1cvopG+nStUfmJJbyk8ieIx4JPDaLwmXpqxAchvGQMzWgKsDwKuzqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795551221;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
	 DKIM-Signature:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=t37btjtuYVqm7Wn4q7QKh/abPX/yviKnKeRqyTCpvJQ=;
	b=S+Gjy20RK+8izrebibxxIus0XEgmhPzPdkcynAfmnCCkcGM0S1RQZ2+E+vBAlzvTaAg5
	 TJI1kPiKGxdB7Yt7ZX7J/+s970Ew/2aNDguotYUylGhlt4eLmmxUYaAMFwrfQeSsCtri9
	 SY/zQI5N25/e0YF21QATsu0Z9Frl0PeewOS8nt0r6vU//YIg0SuuwFeIc4sNR+mNDBgvy
	 AHGFQYD23a5foBBMNG5p3by0O0gIFL9iZtxcdQ+9lKbgH0pQGnPWSyAOI/xV2/7vb85dV
	 0g6rUpKzZmdz3O2y/18UmjovCjdL5NZWQvpETulAa7kb1q1+rbx25fF/0qpVeWcVwpQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=VLAQDHWk;
	arc=none smtp.remote-ip=209.85.214.228
Received: from mail-pl1-f228.google.com (mail-pl1-f228.google.com [209.85.214.228])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 819C8606A685
	for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 20:13:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 819C8606A685
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=VLAQDHWk
Received: by mail-pl1-f228.google.com with SMTP id d9443c01a7336-2f0621eec70so32368335ad.2
        for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 12:13:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795551219; x=1796156019;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:dkim-signature
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=t37btjtuYVqm7Wn4q7QKh/abPX/yviKnKeRqyTCpvJQ=;
        b=GWAidU77hhuCEF1mfnif73Kps7DMiXUV4QFKM6vfzKlI8gA+zvDyvCBeqew4n1nUWC
         67f7CRwHSQSyEs/tmmpJHNJXsE6IN+9t6YZpzE4FwtW9Qq3KepxlwfQzLVdg4yXTOnpA
         yiBR00cr9QW8oX0kXeeid+ADmjaki8F/79aWHUhkQuvc3/k4UTcws/plLukicmKvoYb6
         //r+8HmmrlZLXOWgi8OrH8kl4loUjFMLlorm0rM7p7HP09V5jNJUmYKkwb97OOFvaKOQ
         OfB8PJD0Ku2AootGXaGULmocIgNDUc4o5h0kfiGLKRcbCtQT1uT59yJRapp0nvO9Ic6a
         zqcQ==
X-Gm-Message-State: APuU4Z/8BPxc9PyvE6Iumx88V9z1Zb/P2dddk37WUeglggwg8299H5Ag
	micPuvaS+TAaq5csBIUW4TGkZmf9i5A8YvF/T8FS8HW6Do0bpuHYerEboY2iZlC7Mhn6dVCKSor
	M3whA8KbmQO/8wWCupjuAG5e+FRdtbkAmwmIlf2aEzMIEC5bMtiTp+uBsHeeJMnPPS1TcUdHlbw
	p/qsmcIOhJGu52Xu3BzYUWyqAC85UkdkpxuRdKEJKIOh9o38oZS/knKESuiD4Q19DS8AauZhoqK
	eFUuHXdAru3dgfABYYEp9xM9z7X
X-Gm-Gg: AZFdTZdRLsIF11DJWYLaEy49caiDFVAaBTuGVWO3pzaJmtG7Rdbw22xlpC1OAPATJ0r
	oQHKAofrQ8oKPwRyZhnD4uk/B4Q/syJSKghKgWjWhWP2SJtBWohVWbSo23M1n+vQDXwnbmleUwH
	DiXLzLUMCuiRrx7gMe8LJHPPAQJh5LTUIVnsnGJ1HDSZ49EH3cpbUandGYEZQdpB92DqW4u7Wcf
	1UVj0Zyg9Cl/JwrLNcY0hDUzj+VAE5HYOt9n2K78RiXwNxUwG2KuUipRZ4V9ZhTzmKRZSxy3Xlw
	mphCDseMSRGUvK0I8O64CeHeWGSBWwwIqlXnWp0uaGWhQi5ZrVGIXBCN1RaRqm0XPi+bGlETlVy
	7euLJuoWMyurPYA3yzFxqaOFWjEA5el5GWYifjBB/GQclr+9kQxde6O57A0MXZoR4KAN2FP5/HC
	zIq1J5HKou4yt/hdvAXzHrSr3uwZOqp0lLVkdLdso=
X-Received: by 2002:a17:902:ec8a:b0:2ef:e25e:e13c with SMTP id d9443c01a7336-2f03efb015amr169347375ad.5.1795551218896;
        Tue, 24 Nov 2026 12:13:38 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id d9443c01a7336-2f03f1203c5sm2199335ad.45.2026.11.24.12.13.37
        for <linux-wireless@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 24 Nov 2026 12:13:38 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-55db3f05536so9073111cf.3
        for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 12:13:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795551216; x=1796156016; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=t37btjtuYVqm7Wn4q7QKh/abPX/yviKnKeRqyTCpvJQ=;
        b=VLAQDHWktpzfOfscQ8PtAkXHGaDDQnkVfk43xA7HG0TYZlp2IPLSMpN9YV4FSlMIay
         ohrGl6c96Wj62wNdk9CAQ+wwgRJ0lAvs/Rly+LQ1nmBcdk+cq3xWNnaxtj7wanGiyqxG
         SoADUj2NVTTSNDpy3aBPzCfjRznSPzvy75CS0=
X-Received: by 2002:ac8:59cd:0:b0:533:3bd5:b6e0 with SMTP id d75a77b69052e-55d76b1dc4fmr292105401cf.59.1795551216087;
        Tue, 24 Nov 2026 12:13:36 -0800 (PST)
X-Received: by 2002:ac8:59cd:0:b0:533:3bd5:b6e0 with SMTP id d75a77b69052e-55d76b1dc4fmr292104831cf.59.1795551215467;
        Tue, 24 Nov 2026 12:13:35 -0800 (PST)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55db5bc2f31sm7518711cf.20.2026.11.24.12.13.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 12:13:34 -0800 (PST)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Andre Eikmeyer <dev@deq.rocks>
Cc: linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	Yossef Osman <Yossef.Osman@proton.me>,
	Aditya Garg <aditya.garg@linux.dev>,
	Arend van Spriel <arend.vanspriel@broadcom.com>
Subject: Re: [PATCH wireless v2] wifi: brcmfmac: keep ARP and ND offload off on Apple BCM4355 and BCM4364
Date: Tue, 24 Nov 2026 21:13:31 +0100
Message-ID: <20261124201331.3492571-1-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261118123933.74517-1-dev@deq.rocks>
References: <20261118123933.74517-1-dev@deq.rocks>
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On Wed, 18 Nov 2026 13:39:33 +0100, Andre Eikmeyer <dev@deq.rocks> wrote:
> brcmfmac enables the firmware's ARP and IPv6 ND offload (ndoe) whenever
> the interface is up and not promiscuous. On the Apple firmware for the
> BCM4355 and BCM4364, ndoe makes downloads collapse.

[...]

> Fixes: 52f22fb21764 ("brcmfmac: add neighbor discovery offload ip address table configuration")
> Cc: stable@vger.kernel.org
> Closes: https://github.com/t2linux/kernel/issues/34
> Closes: https://github.com/t2linux/T2-Debian-and-Ubuntu-Kernel/issues/227
> Link: https://github.com/t2linux/linux-t2-patches/pull/85
> Tested-by: Yossef Osman <Yossef.Osman@proton.me>
> Tested-by: Aditya Garg <aditya.garg@linux.dev>
> Co-developed-by: Aditya Garg <aditya.garg@linux.dev>
> Signed-off-by: Aditya Garg <aditya.garg@linux.dev>
> Signed-off-by: Andre Eikmeyer <dev@deq.rocks>
> ---
>  .../broadcom/brcm80211/brcmfmac/core.c        | 27 +++++++++++++++++++
>  1 file changed, 27 insertions(+)

[...]

> @@ -103,6 +120,16 @@ void brcmf_configure_arp_nd_offload(struct brcmf_if *ifp, bool enable)
>  		return;
>  	}
>  
> +	/* With ND offload on while awake, the Apple firmware for the BCM4355
> +	 * and BCM4364 makes IPv6 downloads drop to low rates. macOS runs ARP
> +	 * and ND offload only in sleep, keep both off on these chips.
> +	 */
> +	if (enable && brcmf_is_apple_nd_offload_broken(ifp->drvr)) {
> +		brcmf_dbg(TRACE, "Skip ARP/ND offload enable on Apple BCM%x\n",
> +			  ifp->drvr->bus_if->chip);
> +		enable = false;
> +	}
> +
>  	if (enable)
>  		mode = BRCMF_ARP_OL_AGENT | BRCMF_ARP_OL_PEER_AUTO_REPLY;
>  	else

The comment says IPv6 downloads drop, but according to the commit message
and Blaž's test report IPv4 downloads drop too on the BCM4355. Please
reword the comment to match.

Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>

Regards,
Arend
