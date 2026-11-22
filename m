Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.98
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795378185;
	b=aN/Wh/E163FgOtkzJ7ka6Ngrld06eTehx7PzXcfDl3YOy7tc3EdXSZhPK4im6WhgrreH
	 NO4PnzWDrVud8szKn1IOU/KswaYHaAC95yW/ymzKD/FpmvvQTgmc5SY5L5RIt0ACTsKO7
	 RHilYRraVyJ+HiY1tA2h4Ae2UlL7+nQ1035WTMOCsIRQLwNCGWMLqls8r0TTJ5Ms4sHON
	 F9/kmBUbLwDqbHKK0uYxTVoInUOXRhMJEPfPKhIPZ2UqN94AZcINE+DdXWB+nV0ekO4aw
	 5G3R3tqy/k/3PTmes3vkd9thFr+Ami08Ly80JuZTNatE5TH1t1Y2daiZA+uFZExlO8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795378185;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=eZo3uX94fDb6i+qgCUNfpTyWWfZP+yOV9UK8ddrvWfc=;
	b=XHRQ2Xqo3iyEz7gU3bFN3o8YoV0NQmFMbPTB8Cf/oZgqvetv5dfvUKy+EoIKw6H/uTIW
	 +N51BgUL4vf71HDY9Ht1hP8AvtM7qXw7nuQaCd5BzfqJ7fAljaVX6lhXs2P3D17Y+ytuc
	 L/qmets9bORP6MU8H+a2RtjJtwgypKowGbGV1YRw0FaufKM/1DsIpWNRSCk+0ZC9J407n
	 h6NsvVVCUvf/Lz+DFk97IogRYWsHaLPXuMLk2UsgDCDbgBWhkCk2mjrA6ez/MMyWflZaf
	 NK6JLVyhzlDul8aMRqe2sIX+kfhfZTLZ4joJZLnGBWjf0SSXyWchfb+e2BvX42hZw/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=fjjD9awh;
	arc=none smtp.remote-ip=209.85.216.98
Received: from mail-pj1-f98.google.com (mail-pj1-f98.google.com [209.85.216.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F70C606A68E
	for <linux-wireless@vger.kernel.org>; Sun, 22 Nov 2026 20:09:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F70C606A68E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=fjjD9awh
Received: by mail-pj1-f98.google.com with SMTP id 98e67ed59e1d1-3ac9f49b984so1429397a91.1
        for <linux-wireless@vger.kernel.org>; Sun, 22 Nov 2026 12:09:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795378183; x=1795982983;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eZo3uX94fDb6i+qgCUNfpTyWWfZP+yOV9UK8ddrvWfc=;
        b=O3tTTVZ3cno4e+4a+nlnG0M5C0vI3wj5n3iqNJbDKjDHKk8LpBtmYtipDJp7NLSYzN
         fiPEjFwUmcfSHhIVzZYSa4033dfSHO36fgqaDg8bh4jJCxS2lDBpKWC6FKCDygPCjirU
         /oMXKmkn5iDIYuwsDhj+Pvi9U3KCEq2xn9BC7HZsTAdzLVZlGEPFRlqpEXfmHzAlDNtm
         Ha4biDCq1nL5u39N8Sdh1yXKpYo3dcrwvO/JB15MEB2XecC/FAE8ZFr/6wd69u6IjM/1
         Zt5yV5pZtmMW9zz/qaZZQhWjKviaBwGUvWga3nCKzY0vPNRqEe1RC6G3Imi1Jdhgui/2
         SAMQ==
X-Forwarded-Encrypted: i=1; AL+hErFH56VkFf1tMDRC1PsMVJ7K9n2tWp6kp6z5I2Kihvl0tA8wY5yBRCtD30hF4+l0lIItD3PnX5nPK/VXQch1rA==@vger.kernel.org
X-Gm-Message-State: APuU4Z/DjlkC1yT9nvQduJaqiZqFxrz4MgtR+DShs6uhQ3btHOTU7v1F
	mMQ/j9hWQ6rZiJm+CWyZdo8wCutcdvSF6e2d0cnwT4HPC1at0ySHQuZvhl0eYSrf44B9YLiJUNP
	Qh1YzNfQ91l+iZ3JHtqXqn+cRtE0KgcmTGq+RPxiLCrWg1N8fqxrqf+su8ipsPLTkx95GgpR7lK
	t0vswQPsbBZB5PCJR2Sk6fqnmbtE4jekZgaVFGiDGVXUSVyqYs9zBcxpo6dWXjnp4akljplAiCY
	9mlGb2xk+t07MyCViofeo6AEdDF
X-Gm-Gg: AZFdTZdDZab+1hVCk2/p0iXTmRnGdcTE/+0Qozb6hunw2Ws+98rIjPraWDiqjHYsEK0
	WcMZETUZotZnTG9WHPW9NpYLe2tl37LrUsbnG1jEvzRP0YMFRvDUKdJYrXBc0rQ95IB5mRq9JUJ
	QFS+zz3f6FGdQ3k50NUfaX4P9vgf/l1DMzYlfeojmO2XMDWfkUYzDGVZH4yK8b3BiM85ERbjuy8
	FEUiM8sz5WOAgOiVnpVIaxky+OHaperVAiO40MVkdD/IF6KSG3bn3PnfaAIxjH4izZG52glcAdk
	dfZFpT4Dj4WIcXtRNxm0l7z/PigW8tiZNyQot5sxG24FOyxFcwcVBFAivpNiLiX1ZLgM/WBlxYu
	uEMtUQyidlLaeU2sNNEn4F06rlZDNfKAwL6NN7wC2epbXorX6k1WY2n7blh7WkiumsF346oKTRZ
	8z79uTZruULZKRvJtzHfUie7A5AabdpTD7oxGqMqI=
X-Received: by 2002:a17:90b:2cce:b0:3ac:928a:68ce with SMTP id 98e67ed59e1d1-3b41c95e0ecmr6240701a91.33.1795378183163;
        Sun, 22 Nov 2026 12:09:43 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b41add89d3sm6855562a91.4.2026.11.22.12.09.41
        for <linux-wireless@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 22 Nov 2026 12:09:43 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-94975041698so863899385a.0
        for <linux-wireless@vger.kernel.org>; Sun, 22 Nov 2026 12:09:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795378181; x=1795982981; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eZo3uX94fDb6i+qgCUNfpTyWWfZP+yOV9UK8ddrvWfc=;
        b=fjjD9awhKgUWYZySiNnUZp55Po7jObF1TCWu28I9DZpHy2ib+fo9xyDWKXB4HsRwtA
         OcXX6RzkrAgsMuxa0AcL/pdqCZnCLwoCaDISm9Ji2CMR6G/Y9cgMj6TGLjT5VOGYfEfG
         m+PZBzzcVuJOfEQf6pChUgK3aZL3Kya0lcrqo=
X-Forwarded-Encrypted: i=1; AL+hErE7yAEh/JXF7MTfwD4YC21w1TKZCfc/7O51RyJt1CFOwCNvOzRsYSAxAZIp13ecHlHaFaf32PKwuaM87oOZsw==@vger.kernel.org
X-Received: by 2002:a05:620a:45a8:b0:949:a6b9:25e7 with SMTP id af79cd13be357-949bab310fcmr1492154385a.38.1795378181016;
        Sun, 22 Nov 2026 12:09:41 -0800 (PST)
X-Received: by 2002:a05:620a:45a8:b0:949:a6b9:25e7 with SMTP id af79cd13be357-949bab310fcmr1492150785a.38.1795378180574;
        Sun, 22 Nov 2026 12:09:40 -0800 (PST)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb34ac11sm664845385a.14.2026.11.22.12.09.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 12:09:40 -0800 (PST)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Andre Eikmeyer <dev@deq.rocks>
Cc: arend.vanspriel@broadcom.com,
	linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	Yossef Osman <Yossef.Osman@proton.me>,
	Aditya Garg <aditya.garg@linux.dev>
Subject: Re: [PATCH 5/7] wifi: brcmfmac: add the AWDL data path
Date: Sun, 22 Nov 2026 21:09:28 +0100
Message-ID: <20261122200931.2090372-3-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261104151547.70333-6-dev@deq.rocks>
References: <20261104151547.70333-6-dev@deq.rocks>
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
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On Wed, 4 Nov 2026 16:15:45 +0100, Andre Eikmeyer <dev@deq.rocks> wrote:
> The firmware passes AWDL data frames as 802.3 frames. An LLC/SNAP
> header with the Apple OUI (aa aa 03 00 17 f2 08 00) is followed by the
> AWDL data header 03 04, a 16 bit sequence number, two reserved bytes
> and the ethertype.
>
> Let the AWDL network device send and receive plain Ethernet frames. Its
> transmit function adds the 16 bytes of headers and counts the sequence
> number, brcmf_netif_rx() removes them from received frames. The headroom
> of the network device covers the added header. The addresses of
> received frames are moved so that they form an Ethernet header with the
> ethertype again, which keeps packet taps consistent. Other frames on
> the AWDL interface are dropped.
>
> Tested-by: Yossef Osman <Yossef.Osman@proton.me>
> Tested-by: Aditya Garg <aditya.garg@linux.dev>
> Signed-off-by: Andre Eikmeyer <dev@deq.rocks>
> ---
>  .../broadcom/brcm80211/brcmfmac/awdl.c        | 83 +++++++++++++++++++
>  .../broadcom/brcm80211/brcmfmac/awdl.h        |  9 ++
>  .../broadcom/brcm80211/brcmfmac/core.c        | 23 ++++-
>  3 files changed, 114 insertions(+), 1 deletion(-)

[...]

> @@ -252,6 +274,67 @@ int brcmf_awdl_del(struct brcmf_pub *drvr)
> +/**
> + * brcmf_awdl_encap() - add the AWDL data header to a frame to be sent.
> + *
> + * @ifp: the AWDL interface.
> + * @skb: Ethernet frame, an 802.3 frame on return.
> + *
> + * Called in the transmit path of the AWDL network device, which serializes
> + * it. Return: 0 or a negative error code, the caller frees @skb on error.
> + */
> +int brcmf_awdl_encap(struct brcmf_if *ifp, struct sk_buff *skb)
> +{

Same as in patch 4, Return: has to start its own line. The kdoc
check reports no return value description for brcmf_awdl_encap() and
brcmf_awdl_decap().

[...]

> @@ -653,6 +659,19 @@ static int brcmf_awdl_netdev_open(struct net_device *ndev)
>  	return 0;
>  }
>
> +static netdev_tx_t brcmf_awdl_netdev_start_xmit(struct sk_buff *skb,
> +						struct net_device *ndev)
> +{
> +	struct brcmf_if *ifp = netdev_priv(ndev);
> +
> +	if (brcmf_awdl_encap(ifp, skb)) {
> +		dev_kfree_skb_any(skb);
> +		ndev->stats.tx_dropped++;
> +		return NETDEV_TX_OK;
> +	}
> +	return brcmf_netdev_start_xmit(skb, ndev);
> +}
> +
>  static int brcmf_awdl_netdev_stop(struct net_device *ndev)
>  {
>  	netif_stop_queue(ndev);

In brcmf_netdev_start_xmit() tx_bytes is taken from skb->len on entry,
which is after brcmf_awdl_encap() here, so tx_bytes counts the 16 added
bytes of every frame while rx_bytes in brcmf_netif_rx() is counted
after brcmf_awdl_decap() and leaves them out. Count the length of the
Ethernet frame on both sides.

[...]

> @@ -693,6 +712,8 @@ int brcmf_net_attach(struct brcmf_if *ifp, bool locked)
>  		ndev->netdev_ops = &brcmf_netdev_ops_pri;
>
>  	ndev->needed_headroom += drvr->hdrlen;
> +	if (ifp->awdl)
> +		ndev->needed_headroom += BRCMF_AWDL_HDR_LEN;
>  	ndev->ethtool_ops = &brcmf_ethtool_ops;
>
>  	/* set the mac address & netns */
>

The MTU stays at the ether_setup() default of 1500, so a full size
frame reaches the firmware as 14 + 16 + 1500 bytes. If the firmware
takes less than that, set mtu and max_mtu of the AWDL interface to the
largest payload it accepts with the added header.

You can add my acknowledgement for this patch in v2 series:

Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>

Regards,
Arend
