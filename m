Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.225
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795378189;
	b=ceSga0Vf9l75/WWY4RHR4dbFPENrr+U6IjylnddgsdiV/cGjt4Ji74CKNiXGj7pZBRC4
	 P++rYsvYv7kojXHem2oAXf5dWXHfjaWMZ20TTGmHZrdgV0zClUukCDjCIREHsmgRdnS+p
	 7koffYUmoaDdma6AAIh0GMBmrkFUK6IakqkgASMy0SYmYu1+eHN87s8lgl/G86PjvGy8q
	 uNjOw+p68tM0omiTVTWwNy8DuI/ISCYz05DLv6FWM7B2JU1ZyNqmB68+Hgaa40GUqHHWF
	 LikE/iAaki/cjqx7wObXAeVCD6zSiBy+q66oHi6F/iu/oY9BeINO+n69NWCs3JewWUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795378189;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=kTiDmMcQejKcdkn+MG3mE/4LRNga/Ihe5FTdQb6iz0E=;
	b=geAI6KLh/iHATYkYeekKuWtldQ1Lsn+z1yrrByTBgB6p3PFUr1vdxe0kez992SMGvAPf
	 HRR9gET3ND00qN8CoruhYWXAJyTb+EwOGxNBqxIrFMnUIWjKe0Xx9OxwSN747hQTSuT01
	 gOJGiZXOa27ObiihlqC0ASW3WbAGiAJaWDv7kBa4FBfOeYO+tTZNhNhIWayhgfhFhsCYk
	 AZQckqoNg5tkZ9fmrEymqD1QyqdB6buCOl6RpOZwy2S5OM+Anif7ekXl8RPhGnJOf3wQK
	 jyw2uX4P8MweUieKtbhMWTyVP9vk9S0NmqNQwIp1tnBcRQlnuWvklrOJ9i52JNUjWMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=PBVZvW+J;
	arc=none smtp.remote-ip=209.85.215.225
Received: from mail-pg1-f225.google.com (mail-pg1-f225.google.com [209.85.215.225])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C601606A681
	for <linux-wireless@vger.kernel.org>; Sun, 22 Nov 2026 20:09:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C601606A681
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=PBVZvW+J
Received: by mail-pg1-f225.google.com with SMTP id 41be03b00d2f7-cdba1b5ed8dso1281967a12.1
        for <linux-wireless@vger.kernel.org>; Sun, 22 Nov 2026 12:09:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795378189; x=1795982989;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kTiDmMcQejKcdkn+MG3mE/4LRNga/Ihe5FTdQb6iz0E=;
        b=K2wOHKXV62FblRa1tl6vDhPqGdmICEkQZQ8kmjKAxQ7OdH8QNVCLXm1Qhzg2IqRsMb
         078Rs0eHkwSZRhqHyzKTDlW4+CPnFQ1bUmD5VlM+EoqjryCajef1bQkFqFyYpFa6Uol5
         6uJI4sxDS3SdsaH6hsO70sCerJ0W9mD44cYiHI6zDgIzKsV+javj01jP2mJ4x0swMO2c
         R43VtnAFw73Q4Z+422nQ1YZczoeL+a6QUdHv+mT3Mopednbcm0M4DLGKrRugxlOj2OiU
         uXZesZO7simIkIcE8fMgHJoUPp82J8E5uo4FaVM8Rea36yFbTIItLtPmgVZRyorcDzcl
         p/7A==
X-Forwarded-Encrypted: i=1; AL+hErEIPCRoka0WAowEaGz1FTiVgVD57CWankYZu2OhAAGNyj1Iz8zGYlERPpucoSAUSOuNBfF8pXxiU4aJ9FmKpA==@vger.kernel.org
X-Gm-Message-State: APuU4Z9IdIzgaziFNecBv42Rco9UOo1PiMW8vXjnCJbpzT8mh4Kk0BiJ
	3qXKcClra58AIf2NFKZ32VCuDoUB6ANzEnh4f+jDoegChxlWVfA9+8O0OhDgntwZJl0SV/aaCVr
	wMXYAZbcZ5QgaFO85O7Hzg+EJkrcZjmhako4g+MCsJGNFnl8e2nEcXUrs0FAUSqmQOSXkwoSCX7
	egJHh6u6iqLhM5ku1YE7NnqVMZw5DvaylEpXix/2XakkB6KNQJSOKzRdxERW1lqdQ9/kIPbwJ9F
	7utohsPaGN0LZESHwG9/0nhalb0
X-Gm-Gg: AZFdTZcrRaajhVztEbE7m52nBNDVClwRbGKQIUSeeoPiXvZaYDZH1w3hn36mKVcr/7w
	f1VdXUaO1ZDQT7X61lO/8/X7SF+wC6BGHUPPy5JuwSdNDXIkuvevNRPpbuVunhTX3I56WOBlsJQ
	vgEp3H7jsxX1VO9XtwbAhs0Vcke+HhggXnlqywTh/NkICX3Zq3KEPhiS9Ndau57dTFxSU9j8u49
	La/k27nywWDNflkDh0xumSHdXP2gUxdTt7FmB9DOHxHVdSXEIA5/Zv9/+2pyMfS2EOHvbFQnZmH
	mBpJrfB5vfncJb7jpm5pMCIFJcGZstFNOlK5TyA/ylTF/mSm/dkLSaf/48AxRbDUOZqu2Jw3xWO
	3AAHu0qyXHcKUDt+hRstN7zWvNto3E1uBngWi4r/A4nv6BgZ+kTLYnmHht46oxJ97BcDatsHZwe
	VdNtisvH4wafLxNS76UHY5k3Rh9Xqcs8Gkf/LJSJQ=
X-Received: by 2002:a17:90b:39a7:b0:3b0:e388:d9c9 with SMTP id 98e67ed59e1d1-3b41c8e0cf0mr5807000a91.12.1795378188628;
        Sun, 22 Nov 2026 12:09:48 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b41ae12863sm6954471a91.6.2026.11.22.12.09.46
        for <linux-wireless@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 22 Nov 2026 12:09:48 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f5844cb60so505332485a.0
        for <linux-wireless@vger.kernel.org>; Sun, 22 Nov 2026 12:09:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795378186; x=1795982986; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kTiDmMcQejKcdkn+MG3mE/4LRNga/Ihe5FTdQb6iz0E=;
        b=PBVZvW+Jd/JLYm+a8nH61fatpfkzYpnosP+OCu0WRmpU+Ll23XjPdqzyaEkzW2idVw
         30TXauwNC6ghTBVZVPa9ajnA3fBIhtK44PtPqV4Vwx8Sz8hxesNGbTXmWkYFGpHmMPP4
         IkJjjLaVfq6Xwq1r5nKGRKqZ4sLbXQb58+uAk=
X-Forwarded-Encrypted: i=1; AL+hErEpgmoVGxARziIdRmGtP2GELKcNvzm/OHtWNn3i5tPBV7QvWt7ZYPbPojJPZeEnORcT/7N0KvE0jk7J8XeyjQ==@vger.kernel.org
X-Received: by 2002:a05:620a:318a:b0:93e:c853:fc07 with SMTP id af79cd13be357-949baa0618fmr1654099585a.32.1795378186217;
        Sun, 22 Nov 2026 12:09:46 -0800 (PST)
X-Received: by 2002:a05:620a:318a:b0:93e:c853:fc07 with SMTP id af79cd13be357-949baa0618fmr1654096085a.32.1795378185743;
        Sun, 22 Nov 2026 12:09:45 -0800 (PST)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb34ac11sm664845385a.14.2026.11.22.12.09.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 12:09:45 -0800 (PST)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Andre Eikmeyer <dev@deq.rocks>
Cc: arend.vanspriel@broadcom.com,
	linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	Yossef Osman <Yossef.Osman@proton.me>,
	Aditya Garg <aditya.garg@linux.dev>
Subject: Re: [PATCH 6/7] wifi: brcmfmac: add vendor commands for AWDL
Date: Sun, 22 Nov 2026 21:09:30 +0100
Message-ID: <20261122200931.2090372-5-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261104151547.70333-7-dev@deq.rocks>
References: <20261104151547.70333-7-dev@deq.rocks>
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

On Wed, 4 Nov 2026 16:15:46 +0100, Andre Eikmeyer <dev@deq.rocks> wrote:
> AWDL election, peer discovery and services run in user space. The
> firmware sends and receives the AWDL frames and the data once the host
> has set its AWDL parameters. Add vendor commands of the Broadcom OUI on
> the primary interface for that:
>
> - AWDL_START creates the AWDL interface with the given MAC address and
>   starts AWDL with the given TLVs. AWDL_STOP stops it and removes the
>   interface. Registering and unregistering the network device needs
>   RTNL, vendor commands run with the wiphy lock only. Both commands
>   therefore run in a work item and report their result with the vendor
>   events AWDL_STARTED and AWDL_STOPPED.
> - AWDL_SET_FRAMES replaces the TLVs the firmware sends, the TLVs of
>   awdl_payload and awdl_oob_af_auto. The driver adds the headers.
> - AWDL_SET_SYNC sets the master to synchronize to, with its metric and
>   the distance to it. Leaving out the master makes the device its own
>   master.
> - AWDL_PEER_ADD and AWDL_PEER_DEL add and remove a peer data frames go
>   to. AWDL_PEER_ADD takes the HT and VHT capabilities elements of the
>   peer, which macOS builds from the AWDL TLVs of the peer and passes in
>   awdl_peer_op.
>
> The other firmware parameters of AWDL are set by the driver in the
> order and with the values macOS 15.4.1 sets on the BCM4377 of a
> MacBookAir9,1. The BCM4364 gets slot_bss without SDB,
> its firmware traps with the SDB form while the station is on 5 GHz.
> Some parameters change 500 ms and 5 s after the start.
>
> The AWDL interface is removed before system sleep with an AWDL_STOPPED
> event.
>
> Tested-by: Yossef Osman <Yossef.Osman@proton.me>
> Tested-by: Aditya Garg <aditya.garg@linux.dev>
> Signed-off-by: Andre Eikmeyer <dev@deq.rocks>
> ---
>  .../broadcom/brcm80211/brcmfmac/awdl.c        | 586 +++++++++++++++++-
>  .../broadcom/brcm80211/brcmfmac/awdl.h        |  53 ++
>  .../broadcom/brcm80211/brcmfmac/cfg80211.c    |   5 +-
>  .../broadcom/brcm80211/brcmfmac/vendor.c      |  78 +++
>  .../broadcom/brcm80211/brcmfmac/vendor.h      |  86 +++
>  5 files changed, 804 insertions(+), 4 deletions(-)

[...]

> @@ -53,10 +58,123 @@ static const u8 brcmf_awdl_bssid[ETH_ALEN] = {
> +};
> +
> +/* awdl_election_tree: the master at 0x0f, its metric at 0x15, distance 0x19 */
> +#define BRCMF_AWDL_ELECTION_ADDR	0x0f
> +#define BRCMF_AWDL_ELECTION_METRIC	0x15
> +#define BRCMF_AWDL_ELECTION_DISTANCE	0x19
> +static const u8 brcmf_awdl_election_tree[] = {
> +	0x00, 0x00, 0x00, 0x41, 0x00, 0x00, 0x00, 0x00,
> +	0x05, 0xba, 0x00, 0x00, 0x01, 0x03, 0x04, 0x00,
> +	0x00, 0x00, 0x00, 0x00, 0x00, 0x41, 0x00, 0x00,
> +	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +	0x00, 0x00,
> +};
> +
> +/*

These tables are patched at fixed offsets (0x0f, 0x15 and 0x19 here, and
in slot_bss, awdl_opmode and awdl_peer_op). Say in a comment that they
are copied from the macOS trace and not otherwise documented, and name
the firmware versions they were verified on.

[...]

> @@ -335,6 +455,461 @@ int brcmf_awdl_decap(struct sk_buff *skb)
> +/* Sets a firmware parameter of the AWDL interface, errors are only logged */
> +static void brcmf_awdl_set(struct brcmf_if *ifp, const char *name,
> +			   const void *data, u32 len)
> +{
> +	int err;
> +
> +	err = brcmf_fil_iovar_data_set(ifp, name, data, len);
> +	if (err)
> +		brcmf_dbg(INFO, "AWDL %s: %d\n", name, err);
> +}
> +

brcmf_awdl_set() only logs a failure at INFO level, so AWDL_START
reports status 0 when the firmware rejected awdl, awdl_config or
slot_bss and AWDL is not running. Return the error from
brcmf_awdl_set() and fail brcmf_awdl_enable() on the iovars AWDL needs
(at least awdl, awdl_config and slot_bss). User space then gets the
error in AWDL_STARTED and the interface is removed again. The same
goes for brcmf_awdl_refresh(), which makes SET_FRAMES and SET_SYNC
return 0 whatever the firmware says.

[...]

> @@ -335,6 +455,461 @@ int brcmf_awdl_decap(struct sk_buff *skb)
> +	u8 buf[sizeof(brcmf_awdl_slot_bss)];
> +	u8 *s0, *s1;
> +	int i;
> +
> +	memcpy(buf, brcmf_awdl_slot_bss, sizeof(buf));
> +	/* The BCM4364 firmware traps with the SDB form while the station is
> +	 * on 5 GHz
> +	 */
> +	if (drvr->bus_if->chip == BRCM_CC_4364_CHIP_ID) {
> +		buf[BRCMF_AWDL_SLOT_SDB] = BRCMF_AWDL_SLOT_SDB_OFF;
> +		for (i = 0; i < BRCMF_AWDL_SLOTS; i++) {
> +			s0 = buf + BRCMF_AWDL_SLOT_SLICE0 + 2 * i;
> +			s1 = buf + BRCMF_AWDL_SLOT_SLICE1 + 2 * i;
> +			if (!get_unaligned_le16(s0))
> +				memcpy(s0, s1, 2);
> +			memset(s1, 0, 2);
> +		}
> +	}
> +	brcmf_awdl_set(drvr->awdl.ifp, "slot_bss", buf, sizeof(buf));
> +}
> +

Chip checks like this one are not preferred. feature.c already
carries the per-chip and per-firmware handling (quirks). Set a quirk
for the BCM4364 there and test it here.

[...]

> @@ -335,6 +455,461 @@ int brcmf_awdl_decap(struct sk_buff *skb)
> +int brcmf_awdl_vndr_stop(struct wiphy *wiphy, struct wireless_dev *wdev,
> +			 const void *data, int len)
> +{
> +	struct nlattr *tb[BRCMF_AWDL_ATTR_MAX + 1];
> +	struct brcmf_pub *drvr;
> +	struct brcmf_awdl *awdl;
> +
> +	drvr = brcmf_awdl_vndr_parse(wiphy, data, len, tb);
> +	if (IS_ERR(drvr))
> +		return PTR_ERR(drvr);
> +	awdl = &drvr->awdl;
> +	if (awdl->detached)
> +		return -ENODEV;
> +	if (!awdl->ifp && awdl->op != BRCMF_AWDL_OP_START)
> +		return -ENOENT;
> +
> +	spin_lock(&awdl->lock);
> +	awdl->op = BRCMF_AWDL_OP_STOP;
> +	spin_unlock(&awdl->lock);
> +	schedule_work(&awdl->ctrl_work);
> +	return 0;
> +}

AWDL_STOP while AWDL_START is still queued replaces the pending
operation, there is a single op slot. The START is dropped without an
AWDL_STARTED event, and the STOP finds no interface and reports
AWDL_STOPPED with -ENOENT. User space that sends START and STOP back to
back gets a start that is never answered. Reject the STOP with -EBUSY
while a START is pending, or keep both operations pending and run them
in order.

[...]

> @@ -8,12 +8,97 @@
>
> +/**
> + * enum brcmf_vndr_evts - vendor events of the Broadcom OUI
> + *
> + * @BRCMF_VNDR_EVTS_AWDL_STARTED: result of %BRCMF_VNDR_CMDS_AWDL_START with
> + *	%BRCMF_AWDL_ATTR_STATUS and, on success, %BRCMF_AWDL_ATTR_IFINDEX.
> + * @BRCMF_VNDR_EVTS_AWDL_STOPPED: the AWDL interface was removed, after
> + *	%BRCMF_VNDR_CMDS_AWDL_STOP or before system sleep, with
> + *	%BRCMF_AWDL_ATTR_STATUS.
> + * @BRCMF_VNDR_EVTS_LAST: number of vendor events.
> + *
> + * The value of an event is its index in the vendor events and its vendor
> + * subcommand.
> + */
> +enum brcmf_vndr_evts {
> +	BRCMF_VNDR_EVTS_AWDL_STARTED,
> +	BRCMF_VNDR_EVTS_AWDL_STOPPED,
> +	BRCMF_VNDR_EVTS_LAST
> +};
> +
> +/**
> + * enum brcmf_awdl_attrs - attributes of the AWDL vendor commands and events
> + *
> + * @BRCMF_AWDL_ATTR_ADDR: MAC address, of the AWDL interface or of a peer.
> + * @BRCMF_AWDL_ATTR_PAYLOAD: AWDL TLVs for the firmware parameter
> + *	awdl_payload.
> + * @BRCMF_AWDL_ATTR_OOB: AWDL TLVs for the firmware parameter
> + *	awdl_oob_af_auto.
> + * @BRCMF_AWDL_ATTR_MASTER: MAC address of the master (u8[6]).

Two points on this interface. The vendor commands are the exception
agreed for AWDL, which makes this header ABI that cannot change after
merge:

- AWDL_STOPPED is only sent for AWDL_STOP and before suspend. When the
  firmware removes the AWDL interface on its own
  (brcmf_awdl_if_removed() in patch 4) the net_device disappears and
  user space is not told. Send AWDL_STOPPED in that case as well.
- brcmf_vndr_cmds and brcmf_awdl_attrs start with an UNSPEC entry,
  brcmf_vndr_evts does not, so AWDL_STARTED is subcommand 0. Add an
  UNSPEC entry here, and describe BRCMF_AWDL_ATTR_UNSPEC in the
  kernel-doc, the kdoc check warns about it.

Regards,
Arend
