Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.99
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795378186;
	b=Wg40rCJU26jzetfpgMrWw6p6UZafFyW5UURfQfh8ZRctBTt1Izp3uoiDRDmihx5VO+VP
	 5Ow28z2qYI/LeuFLCgXGaWeS8MLP5QXhdipzHiqIuokIokFU+4jQXFArjxNtUbRDfOaD0
	 FzcgsrAb7r5il80gJLlAooyNTEbuVZpMgJPBStn+rGzZ5nsWNgsyiZ4DWR2UVDRvk0bPx
	 +Z9MQzsdF91gaI6KRln8hg99Zp/JgFbvTysaZ7IBPCZZUTYFe4RpWufkmMlYC3pUjTn89
	 UmSfeYTT0SPWhjAixKcZ1qm4gWoh49Q/8vrc9QMx9VI/V6uFNjMa2ll+8QcArTKm0qQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795378186;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=rcbebePUPzdbCQMCqhzAbHIDU8UxYYQNkrNaGpM3mnE=;
	b=4iRVzCzu6RFhbyJK40PvTCD1dOrEtMHvcvmUmdRNhanweoF4qGq1fDTNWGwFEpy5b84V
	 Zt26pUPvaWJrkL9rscSCCT18dGVVcrTpt6JTruvn5RO6Nx4a9MYN8FauJm0HOuU6BcZW0
	 O2vweOAe93cRmDvc8CZdi5uVFUppmuJV1dk9YSq36jU+5cSlaLr5vXmpyH+5g94XQPfgT
	 O8VJK0GoMlF/fJUboLpa824yISRv1qyoKEpW5BZt1/EfVOxEkXM82aFn0prAX4pGGEa7/
	 f8cDskSbPFA4ax+bDVgZJbsicnXtLHgD079REWQqOIJF97DMQCc699OHQ/5Rzcxt3EQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=NEJylvT3;
	arc=none smtp.remote-ip=209.85.216.99
Received: from mail-pj1-f99.google.com (mail-pj1-f99.google.com [209.85.216.99])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B47D9606A33E
	for <linux-wireless@vger.kernel.org>; Sun, 22 Nov 2026 20:09:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B47D9606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=NEJylvT3
Received: by mail-pj1-f99.google.com with SMTP id 98e67ed59e1d1-3b09a83d12aso1853997a91.2
        for <linux-wireless@vger.kernel.org>; Sun, 22 Nov 2026 12:09:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795378185; x=1795982985;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rcbebePUPzdbCQMCqhzAbHIDU8UxYYQNkrNaGpM3mnE=;
        b=01yTkS3xuj9XhYGOTjPLmOR3evakKIs9Tp1tzBhQkxB27+G8Nt+DO2mHjJIMcihqqX
         DHx7WJeTzKmJ1F4EkwoZYRMQLCPS2ruS94Ua0Lzd313/GZYmTGwIcaSRrYHFOh5+NOrR
         25bj66MUWOm2sBGHOSwMLtBzDjcay8PNC5wB6KsszxWgqCSNRa71gXbwGFaaQvWo1AI5
         OmJiQNms0CbefOhLbTL+zhUDLSLkRVYdHqFOTgyw98uz3wSRQyvhZcNNwpP+DhskbJAv
         yrHCXuIOKYPicd5s2nCmmm7brkOvlbMZWW6Ld7z+fZOVG614Mind06tHBVcKCwPrwOrH
         s7VA==
X-Forwarded-Encrypted: i=1; AL+hErFDEaEOTYOblk7TMgSMwmtEriI8vZxNPNNVwV9EaXIpZK1JPrEUkiD5gzaO6+uMwjRq/kZUgwF3U8L9D9gvPA==@vger.kernel.org
X-Gm-Message-State: APuU4Z/5/Pucn9xccD1V8O4kzune21it5SflthmOS20Q0QEJ0QUiL0/U
	577NN3F5Oiz8qE0CJ8MkuzNJFXYpuKxpzUxVqs2/Pw16X/JN9OzLbF9QPCqAR5B0mpPWUa95Nmn
	ZxNt7dnHBWa0dcBcKQxoKRglUyt7U13VGPod94v8XWwBs69ri9kzHaChRQKQGWeEnTE972tU5kP
	3JEPRqxytf2qwCa1nRDCjdq1fuaWi91vBGaZF7sB8vePaWe5dMx4hEkS+1FTfwqRrT2nKazQVOt
	T//ah+myxWPDRG3p7AU6iGJMA==
X-Gm-Gg: AZFdTZdbYg4yBLuFpxVHtDCXpC/yUxeQpBKU8B1V1J7cK5F6KXy+SL5qF3tTTpppt6w
	/FR33Gka09y6X3NQ029sgolzq8BG23lordXk4XwUBrVQZgLGjxfP74p+FggAEHP9P7dasXzIzzt
	rowgF902VHOFuqc48Cj9nUNXBzA4dblwpugVD4daohTu1S/SXbZOHLl5oYi2LHpfiU+PW/J1/Kr
	/8zGkIPFF8zLIws6YkZ/o66LHnbx2CBmD5DLXrWGL/z012SvUPXLDzGvqjnEr4VLRXVe6h842zL
	VOwa/VgK9lTBDkOcHZ/5gXlX3/I/j3f5q5hMRLP4p6gLA40Ri3MitzodOpWg8ArLUtXlN3CAG+E
	lWMC0oszNKSAJsRAgtCWfs6D7VdpQjKSUdRPX1bJpiC22zTNzC2Ln7TT7ARS57Ovt1BPGRNpmQt
	3jMkVK612ilyvavN7sVGnDj//IxV8VVqge/1o5IyQ1OA==
X-Received: by 2002:a17:90b:5289:b0:3a4:77b8:1770 with SMTP id 98e67ed59e1d1-3b41c8fe855mr10111309a91.15.1795378185002;
        Sun, 22 Nov 2026 12:09:45 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-100.dlp.protect.broadcom.com. [144.49.247.100])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b420058a4csm3334404a91.4.2026.11.22.12.09.44
        for <linux-wireless@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 22 Nov 2026 12:09:44 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-949dc497896so65900285a.0
        for <linux-wireless@vger.kernel.org>; Sun, 22 Nov 2026 12:09:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795378183; x=1795982983; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rcbebePUPzdbCQMCqhzAbHIDU8UxYYQNkrNaGpM3mnE=;
        b=NEJylvT3N8KSXAE+XAzeZpyzWfogj8GnKBDa0jgEhuieHDxm/PoUGmqU4KnuV2HjvC
         QkuR2gox14XVXh8VH+1Zhqw+ebhaLMUp7Ayxo/VQVw7U3vICwA5Zed3foNMnIcpP1F6b
         9pdYn+YCW/apVNfGbfcAb+YlK3UQqk4q8gZek=
X-Forwarded-Encrypted: i=1; AL+hErGNZ8wp7Oyjs+ep5k7CdElzDICyuKcdqHLHUb6UPe2+Q+2+E6kMs1VfhKYbg164B2Uaef3h4VWNsg2aSCzbXQ==@vger.kernel.org
X-Received: by 2002:a05:620a:6482:b0:949:35ae:6458 with SMTP id af79cd13be357-949bab0c169mr1703409385a.43.1795378183503;
        Sun, 22 Nov 2026 12:09:43 -0800 (PST)
X-Received: by 2002:a05:620a:6482:b0:949:35ae:6458 with SMTP id af79cd13be357-949bab0c169mr1703404485a.43.1795378183023;
        Sun, 22 Nov 2026 12:09:43 -0800 (PST)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb34ac11sm664845385a.14.2026.11.22.12.09.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 12:09:42 -0800 (PST)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Andre Eikmeyer <dev@deq.rocks>
Cc: arend.vanspriel@broadcom.com,
	linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	Yossef Osman <Yossef.Osman@proton.me>,
	Aditya Garg <aditya.garg@linux.dev>
Subject: Re: [PATCH 4/7] wifi: brcmfmac: create and remove the AWDL interface
Date: Sun, 22 Nov 2026 21:09:29 +0100
Message-ID: <20261122200931.2090372-4-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261104151547.70333-5-dev@deq.rocks>
References: <20261104151547.70333-5-dev@deq.rocks>
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

On Wed, 4 Nov 2026 16:15:44 +0100, Andre Eikmeyer <dev@deq.rocks> wrote:
> Firmware with AWDL support takes an interface of type AWDL from
> interface_create. The host gives the MAC address, the firmware
> interface index 2 and the AWDL BSSID 00:25:00:ff:94:73. The firmware
> answers with an interface event like for any other interface.
>
> The AWDL interface lives outside cfg80211. Add brcmf_awdl_add() and
> brcmf_awdl_del(), called with RTNL and the wiphy mutex held, which
> create and remove it together with a network device "awdl%d":
>
> - The interface events of the AWDL interface complete a wait in
>   brcmf_awdl_add() and brcmf_awdl_del() instead of going to the
>   cfg80211 handler. A vif_event armed for a P2P or AP interface at the
>   same time stays with that interface. When the firmware removes the
>   AWDL interface on its own, the event worker removes it as before.
> - The network device gets its own net_device_ops with open, stop and
>   start_xmit before it is registered. The firmware filters AWDL traffic
>   itself.
> - brcmf_net_attach() and brcmf_net_detach() also register and
>   unregister a network device outside cfg80211 with RTNL held.
> - brcmf_awdl_add() needs the AWDL feature and a free firmware
>   interface index 2.
> - The AWDL interface uses direct addressing like an AP, every peer
>   gets its own flowrings. brcmf_awdl_del() deletes them before it
>   stops AWDL and removes the interface.
> - The AWDL interface is removed in the cfg80211 suspend callback while
>   the firmware still takes commands.
>
> Tested-by: Yossef Osman <Yossef.Osman@proton.me>
> Tested-by: Aditya Garg <aditya.garg@linux.dev>
> Signed-off-by: Andre Eikmeyer <dev@deq.rocks>
> ---
>  .../broadcom/brcm80211/brcmfmac/Makefile      |   3 +-
>  .../broadcom/brcm80211/brcmfmac/awdl.c        | 268 ++++++++++++++++++
>  .../broadcom/brcm80211/brcmfmac/awdl.h        |  47 +++
>  .../broadcom/brcm80211/brcmfmac/cfg80211.c    |   6 +
>  .../broadcom/brcm80211/brcmfmac/core.c        |  59 +++-
>  .../broadcom/brcm80211/brcmfmac/core.h        |   7 +
>  .../broadcom/brcm80211/brcmfmac/fweh.c        |  17 ++
>  7 files changed, 398 insertions(+), 9 deletions(-)
>  create mode 100644 drivers/net/wireless/broadcom/brcm80211/brcmfmac/awdl.c
>  create mode 100644 drivers/net/wireless/broadcom/brcm80211/brcmfmac/awdl.h

[...]

> @@ -0,0 +1,268 @@
> +/**
> + * brcmf_awdl_add() - create the AWDL interface.
> + *
> + * @drvr: device.
> + * @mac: MAC address of the AWDL interface.
> + * @ndev: set to the network device of the AWDL interface.
> + *
> + * Called with RTNL and the wiphy mutex held. The interface uses the firmware interface index 2
> + * and the AWDL BSSID 00:25:00:ff:94:73, which the host passes to the
> + * firmware. Return: 0 or a negative error code.
> + */
> +int brcmf_awdl_add(struct brcmf_pub *drvr, const u8 *mac,
> +		   struct net_device **ndev)

Return: has to start its own line for kernel-doc. The kdoc check reports
no description for the return value of brcmf_awdl_add().

[...]

> @@ -0,0 +1,268 @@
> +	if (!err)
> +		left = wait_for_completion_timeout(&awdl->if_event,
> +						   BRCMF_AWDL_IF_TIMEOUT);
> +
> +	spin_lock(&awdl->lock);
> +	awdl->adding = false;
> +	ifp = awdl->ifp;
> +	spin_unlock(&awdl->lock);
> +
> +	if (err) {
> +		bphy_err(drvr, "AWDL interface_create failed: %d\n", err);
> +		return err;
> +	}
> +	if (!left || !ifp) {
> +		bphy_err(drvr, "no interface event for the AWDL interface\n");
> +		return -ETIMEDOUT;
> +	}
> +
> +	/* Like an AP, AWDL sends to each peer through its own flowrings */

When the interface event does not arrive within BRCMF_AWDL_IF_TIMEOUT,
brcmf_awdl_add() returns -ETIMEDOUT but the interface stays created in
the firmware. If its event comes in later, adding is cleared so
brcmf_awdl_if_added() does not take it. brcmf_add_if() has stored the
ifp in iflist with interface index 2 by then and nothing removes it.
brcmf_awdl_ifidx_used() makes every following brcmf_awdl_add() fail
with -EBUSY until the device is detached.

On this path send interface_remove, and drop an ifp that shows up
afterwards with brcmf_awdl_drop_if() instead of leaving it in iflist.

[...]

> @@ -0,0 +1,268 @@
> +	}
> +
> +	/* Like an AP, AWDL sends to each peer through its own flowrings */
> +	brcmf_proto_configure_addr_mode(drvr, ifp->ifidx, ADDR_DIRECT);
> +	err = brcmf_net_attach(ifp, true);
> +	if (err) {
> +		spin_lock(&awdl->lock);
> +		awdl->ifp = NULL;
> +		spin_unlock(&awdl->lock);
> +		brcmf_awdl_drop_if(drvr, ifp);
> +		return err;
> +	}
> +	brcmf_dbg(INFO, "%s: AWDL interface, bsscfgidx %d ifidx %d\n",
> +		  ifp->ndev->name, ifp->bsscfgidx, ifp->ifidx);
> +	*ndev = ifp->ndev;
> +	return 0;

The other brcmfmac interfaces get SET_NETDEV_DEV(ndev,
wiphy_dev(cfg->wiphy)) in cfg80211.c. The AWDL net_device has no parent
device, so /sys/class/net/awdl0/device does not exist and the interface
is not tied to the bus device in sysfs. udev and network managers that
match on bus path, driver or parent device do not find it. Add
SET_NETDEV_DEV(ifp->ndev, wiphy_dev(drvr->wiphy)) before
brcmf_net_attach().

[...]

> @@ -642,6 +640,42 @@ static const struct net_device_ops brcmf_netdev_ops_pri = {
>  	.ndo_set_rx_mode = brcmf_netdev_set_multicast_list
>  };
>
> +static int brcmf_awdl_netdev_open(struct net_device *ndev)
> +{
> +	struct brcmf_if *ifp = netdev_priv(ndev);
> +
> +	if (ifp->drvr->bus_if->state != BRCMF_BUS_UP)
> +		return -EAGAIN;
> +
> +	/* The firmware runs AWDL, the link is there while it exists */
> +	netif_carrier_on(ndev);
> +	netif_start_queue(ndev);
> +	return 0;
> +}
> +
> +static int brcmf_awdl_netdev_stop(struct net_device *ndev)
> +{
> +	netif_stop_queue(ndev);
> +	netif_carrier_off(ndev);
> +	return 0;
> +}
> +
> +/*
> + * The AWDL interface gets no multicast list and no MAC address change, the
> + * firmware filters AWDL traffic itself.
> + */
> +static const struct net_device_ops brcmf_netdev_ops_awdl = {
> +	.ndo_open = brcmf_awdl_netdev_open,
> +	.ndo_stop = brcmf_awdl_netdev_stop,
> +	.ndo_start_xmit = brcmf_netdev_start_xmit,
> +};
> +
> +static bool brcmf_netdev_is_brcmf(struct net_device *ndev)
> +{
> +	return ndev->netdev_ops == &brcmf_netdev_ops_pri ||
> +	       ndev->netdev_ops == &brcmf_netdev_ops_awdl;
> +}
> +
>  int brcmf_net_attach(struct brcmf_if *ifp, bool locked)
>  {
>  	struct brcmf_pub *drvr = ifp->drvr;

brcmf_inetaddr_changed() finds the interface by its net_device, so an
IPv4 address on the AWDL interface reaches the ARP offload code. With
arp_version 1 that code uses the primary interface and adds the AWDL
address to its arp_hostip table, so the firmware answers ARP for the
AWDL address on the station interface. Skip ifp->awdl in
brcmf_inetaddr_changed().

It looks like this is the/another reason for the arpoe/ndoe patch [1]
sent. At least for the ARP disabling part.

Regards,
Arend

[1] https://patchwork.kernel.org/project/linux-wireless/patch/20261118123933.74517-1-dev@deq.rocks/
