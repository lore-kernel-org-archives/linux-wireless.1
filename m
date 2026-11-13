Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=37.252.191.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794559178;
	b=c4xKQBFcaFyvsqXqUOsVdW2/n1Z8VMCBXPDn0SmUzEJD6NO3ruMrM3iUJzHch+80bG3l
	 /ia8fLiOOtI1QTaGmfpuLeUTlpVx3ayxhJ0vWwx+CsOGuthAokQmMugRb2DEMkRDMj7Gj
	 +D5+Mz6UhIXKGQnamlSWiEjeYSZ0B2Vyps5T7hjhFmSrzTSx17qJOybbUmSzH0QoD/uV5
	 1x4MX+Jc/q7WtvGmG0yrHxYW9+l7YLWpAm4o6KUZhkMP1uj4BpmGhLJyqTKWRM4LQxDiF
	 YXpAXfhJeU95XE+brYj975Ll9zOAf5PJte4jw6NkPPP6Al/ApocRqmHJYL6mVLgWbRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794559178;
	h=DMARC-Filter:Received:DKIM-Signature:Received-SPF:Message-ID:Date:
	 MIME-Version:User-Agent:Content-Language:To:Cc:From:Subject:
	 Content-Type:Content-Transfer-Encoding:X-PPP-Message-ID:X-PPP-Vhost;
	bh=/nsIgMSuEZ3IjLcOmBYDv4yvMTvK+ErcT3BPn2PeS9E=;
	b=241QXEtqSJMZGXokIobMesGZ49O3TTteQUOJJAb3lnH1rP1PP+Yzp8XedS0DIRoQPFkU
	 mk7Yybz29sXWRx/nZjlWvKAdXBDW1NxSb5gyNVX5G3I55FC0MAYHIp6dp8vpk2BpalyFE
	 DZOkCbMiWWYruLIgTtMTIAoxUKkWKnIgsl4ONLcpPbuyE5fjD/SozbmNjncGvx19SOXF5
	 Qkmj9ox158rvMAnKgOvde5+dMCPYdLTH1tPJhilP3lFEpSlgAhwAOx0hPHIrDgL3UPLAg
	 mEQc5XbbxJOcbk2E+2eQaqHv8KxZme+H3F7qPNqfap0yfLooqmrENuRe77i4wP7HhEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=itsolution.at;
	spf=pass smtp.mailfrom=itsolution.at;
	dkim=pass header.d=itsolution.at header.i=@itsolution.at header.a=rsa-sha256 header.s=default header.b=LNdMk8ct;
	arc=none smtp.remote-ip=37.252.191.174
Received: from mail2.incublab.at (mail2.incublab.at [37.252.191.174])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A352D606B1CA
	for <linux-wireless@vger.kernel.org>; Fri, 13 Nov 2026 08:39:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A352D606B1CA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=itsolution.at
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=itsolution.at
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=itsolution.at header.i=@itsolution.at header.a=rsa-sha256 header.s=default header.b=LNdMk8ct
Received: from [192.168.100.123] (h081217101012.dyn.cm.kabsi.at [81.217.101.12])
	by mail2.incublab.at (Postfix) with ESMTPSA id 88F26A075B3;
	Fri, 13 Nov 2026 08:39:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=itsolution.at;
	s=default; t=1794559163;
	bh=/nsIgMSuEZ3IjLcOmBYDv4yvMTvK+ErcT3BPn2PeS9E=; h=To:From:Subject;
	b=LNdMk8cteDvTGSPaoLn7s3LP3kSbEREUbO2bGrrjhK6JmsLfZAuSvrctXLl9FBiI/
	 r281XuYQby/vlIBNOJThc0R1pj2TmSmIlKAZJGgjZZK5GBnNTDwwQDXCNJwSdDG6t4
	 7PligbHmYQc5cVukTGBJv4vrLxz0YoTLC46crmOU=
Authentication-Results: mail2.incublab.at;
        spf=pass (sender IP is 81.217.101.12) smtp.mailfrom=argishti.khachik@itsolution.at smtp.helo=[192.168.100.123]
Received-SPF: pass (mail2.incublab.at: connection is authenticated)
Message-ID: <b010a7fa-73ea-43fa-a020-c2ea706295dd@itsolution.at>
Date: Fri, 13 Nov 2026 09:39:23 +0100
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Betterbird (Linux)
Content-Language: en-US, de-AT
To: linux-wireless@vger.kernel.org, brcm80211@lists.linux.dev
Cc: iommu@lists.linux.dev, regressions@lists.linux.dev
From: Argishti KHACHIK <argishti.khachik@itsolution.at>
Subject: [REGRESSION] brcmfmac BCM43602: DMAR read faults and firmware
 timeouts on 7.3.3 with intel_iommu=on, works on 7.2.14 / with iommu=pt
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: <179455916379.2529963.3953393442639834989@mail2.incublab.at>
X-PPP-Vhost: itsolution.at

Hi,

since updating from 7.2.14 to 7.3.3 (Fedora 44 kernels), the
BCM43602 Wi-Fi in my Dell XPS 15 9550 is unusable when the Intel
IOMMU is in translation mode. Booting with iommu=pt fixes it.

Hardware: Dell XPS 15 9550, BIOS 1.14.0 02/13/2020
Device:   Broadcom BCM43602 [14e4:43ba], PCIe, brcmfmac (msgbuf)
Firmware: BCM43602/1 wl0: Nov 10 2015 06:38:10 version 7.35.177.61
           (r598657) FWID 01-ea662a8c (linux-firmware)
Cmdline:  ... intel_iommu=on

Results:
- 7.2.14-200.fc44.x86_64:            works
- 7.3.3-200.fc44.x86_64:             broken
- 7.3.3-200.fc44.x86_64 + iommu=pt:  works

Userspace and firmware are identical in all three cases.

The firmware loads fine, then a few seconds later the IOMMU
rejects DMA reads from the card:

   brcmfmac: brcmf_c_preinit_dcmds: Firmware: BCM43602/1 wl0: Nov 10 
2015 06:38:10 version 7.35.177.61 (r598657) FWID 01-ea662a8c
   brcmfmac 0000:02:00.0 wlp2s0: renamed from wlan0
   DMAR: DRHD: handling fault status reg 2
   DMAR: [DMA Read NO_PASID] Request device [0000:02:00.0] fault addr 
0xfff83000 [fault reason 0x06] PTE Read access is not set
   DMAR: [DMA Read NO_PASID] Request device [0000:02:00.0] fault addr 
0xfff80000 [fault reason 0x06] PTE Read access is not set
   DMAR: [DMA Read NO_PASID] Request device [0000:02:00.0] fault addr 
0xfff7e000 [fault reason 0x06] PTE Read access is not set

After that, every firmware command times out:

   ieee80211 phy0: brcmf_msgbuf_query_dcmd: Timeout on response for 
query command
   ieee80211 phy0: brcmf_cfg80211_get_channel: chanspec failed (-5)
   ieee80211 phy0: brcmf_run_escan: error (-5)
   ieee80211 phy0: brcmf_set_wsec: failed to change PSK in firmware (len=0)

and after about two minutes the command ring is full:

   ieee80211 phy0: brcmf_msgbuf_tx_ioctl: Failed to reserve space in 
commonring
   ieee80211 phy0: brcmf_run_escan: error (-12)

Unloading and reloading brcmfmac reproduces the same DMAR faults
right after the firmware loads again.

User-visible effect: networks show up briefly, connecting never
completes, then the scan list goes empty. Boot is noticeably slower.

I can provide the full kernel log, test patches or bisect between
v7.2 and v7.3 if that helps.

#regzbot introduced: v7.2..v7.3

Thanks,
Argishti
