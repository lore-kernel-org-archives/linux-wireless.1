Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.173
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795383057;
	b=JLccLwVhyINLgljrEAlbANnU+tL2vqup55K6b1udWnC8k2ma1qzx1dULyTLbWl8ZpYEz
	 8GjyXguGJRgSvu95C2vP4CGVnX/DRaOc9gg1qbLHezzj4YLu4AJyvwcehfcaF3D6bZQMO
	 Pv6cWhFZGlmIZ4w5G1kYllwsCzaDgQTvxfBNpSwtxTIB5uqtcuL8FaK45ilzMfCILlwBy
	 zmKclrLdWZm9mUkqc+hpqEb9zfffvhthju9tpmgyyp678cB85xJTgQiWBv2kltRnG30jC
	 xJ52Nr1ik63g6IZHHUX3VNmxCI5gkJzTRnPdR95QeDGEdprGXDl3IPF9Z8v59qXUjNg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795383057;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=vt9VTm+pAq3KhKo0/QsIu0nLRSOVPIiBQvAGNBRnUTo=;
	b=y7L9Qk5pxvD3ftjPr0jdbbjZR5wulWJ8gmLW3P1a3IsXF3xox3/NRZvewGOdtOg8FVWG
	 7v8T8XpTp1Mxrt4wk11kHWIgfGzti3aJ296D1nsD9b1OpO9dgxtyD/9isP5GBRwatW7x3
	 jYKaUuNNHFdzjXEgtP4oUewOB3Ug+OQpFTKETWXJkPayw53HKZoAH0r74bkDzcrP3CVAl
	 Fmj9Zc9VHwj5/jKPyrPGoW9QioJFbc5rLNHLkmaemnwPeNkj+MBTkH/5dKd2fvc7ACbuK
	 S5gPUBSExIN33kIKv4IzKX69KEXcnK3ciYeAFk9+/oTSDKAjICe9yLYTCm7+8EsdOKQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Art9EaHe;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.173
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E081606A31D
	for <linux-wireless@vger.kernel.org>; Sun, 22 Nov 2026 21:30:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7E081606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Art9EaHe
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-55650fe1f0dso1558952b6e.2
        for <linux-wireless@vger.kernel.org>; Sun, 22 Nov 2026 13:30:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795383056; cv=none;
        d=google.com; s=arc-20260327;
        b=pCjiAcJUsWAAlOnB/oZo/P5K5MbFxu7Ip2KZzmjgpZmKc9YOYpAnJ17dDRjDhScYQT
         2OTp5+gtUmZf8Z/Xl7k5V5ObJbyE3WDhB0cp+hqCAF72kFmdR57Hzbz+SEBtFFx0/x8x
         zds71PQ5w6EOVx9MUX+MATMLXnD9iupACOC1DjRG6lcWRmt94XhrK8xkFJe+ooi3CkaC
         72ndQFfGFXnVNrn/Koo15rkSOHE8/LmkgH/KmEYGdHG59lJkl/FqNXCQ24Y4N7yz6hqH
         MVpbcapCJlX3+kbfkKIjFELkr/Uge475SJwqEiReiIgJ7FlelqeNiMwsz5fKPEcm/D1k
         FOSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=vt9VTm+pAq3KhKo0/QsIu0nLRSOVPIiBQvAGNBRnUTo=;
        fh=mIokBReLv0z458GD2Z7WSs8vvOLqIayQqs1EuKALvNI=;
        b=swQZz6H5IJkElbCyMw0kOkS1USeyd4PQ4KKjm5uLGaBeuB2p8fziXWYTKlJ/VuwaA3
         6jXqSmZUt6rb8i3o/rV8U8Ifc0+g9vnzPIvq3cNpOJrWHMfZHACSo/4j/gVv9e52LiMz
         71PW3kPKbb6FI0AR9gt0J/+NPnUF5C++Pg+yGOiZmGgRNFLz2N1MNhSTnF9IdbVhzdrC
         K265jcqk1X/cQRtMxR00YuGLngK6XyOcq/8o/mkwtPWyQpnCq+DoO8ARLLcPpd7OugCf
         oJTAfk0kVkOjIKnRGK/VgtoP05A3gh4e/mWJswvG2etEKp9lbW9VEriRxVVdKeIf2oi2
         4Pvw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795383056; x=1795987856; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vt9VTm+pAq3KhKo0/QsIu0nLRSOVPIiBQvAGNBRnUTo=;
        b=Art9EaHeW2KjApq6ZCKMVOpvYV4glarZwFPZ5OcESljisYk/5si6AjFaV7qJRaGOTR
         4dJYqxprbn+Gx5QBe4ozPUADDRpk65lbNOwB+R+WmUXLdQF/ALMOMhIpCp2tuHYmUg//
         Y1Kz8rtYfIbMw1wndv1pkG2Ac3G0ckSldiqF4yvkmoO07q3pFrzmAYll1OMLPK8nwYTb
         RP7o7evXL4FC1+rYHtTM3dY9ukH35JjV+e7P75im6mS3hs8StUrynv5AjFfCPjZzwgmz
         46KaIktE+FTOzpCCx3UpJwsr/XPS5D7uqtHFv3Sn/e8KtogHmrKMdL7q8Cn9xYu8+mqv
         qapg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795383056; x=1795987856;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=vt9VTm+pAq3KhKo0/QsIu0nLRSOVPIiBQvAGNBRnUTo=;
        b=U4INK2fV5swW2pl3aSrdf0fzGZRwCbUgV+8vE/FfCKH4a2AtN1K1JhfNIQezGJ59Pj
         Rh+GD1LvBUPQl+nBZfiJQAtPgqp0Abp9r7v2qr+M12hD1cs2uDMigwXnmdRDSMQb9kvy
         qyaoXojTQ8wPdm8L1xpNSMOKogd3Nv2JvAn8r7QgHsv0kk8O+l8AAa64EmWzSdlElmYP
         TWG6t3qt8Cd0abtfR6aMupQruFlxY+gL7nxk3JM8WdfuFPcuMvzBMOSnGCywQYOZWxRM
         TFccj+ZEAcn/6M19Ahm+gCyk6XYqXAlBbtzuLO51j9zdWB4B0ksRmz0jdBlPyjk4tl8n
         7dqQ==
X-Gm-Message-State: APuU4Z8xtLuYFPG2S+fYIK1YA/vCCwBW+EoQpX5x8jNIRveP7af9uIVV
	iKDHGsvvIQO5lQOio7zUyszQrBfhgYbv4n+p0R/LhMh6IHX7kPg5Kn3TomEG6bp6wGwFv2gsNEl
	pG0kOpmSTvIHSNDE2dycF/GI6xkNnWn5z9f9V
X-Gm-Gg: AZFdTZfKsy1VGyWAqKHcfK1IZWpswRB8EcsafClA85cpq7a5KTGpR2zEW7ni4rsVVKE
	AZSw1zuJzx1/j6Cauv/QtexsaCM1kDHKh1jrd/foTvgpnKKKhqughxTOUhvYurEQVzk3SKcAF2a
	tFTnVqZ1MGhJUlL/LWZMexesPtEieIId1Q8JFSBLXRf2uANW453F4vG1B3dcKKr5Yt91shv4KD6
	QBI0T+A25TzX9f4vvJMDPXycj4lSr1X8yUIK+3lO5iBlSO9nrmQH4CfDhTLMnc7ArRzTq5WKB+4
	IkWbvIxhp45K2d6W4xmPmhP7ynToSbwFYfepNvdYpoOfb24JMAlEVfc5nKSmLvm2vHwXrF2IcqU
	xpu5atlwqlgY+Obm+H64OzHp57HSI88OPeBtHVE48WbCb9f1WQHD9VKPM/3CrR3QYUcqF4/w6M9
	g9tej7hH6Nsh4Q98sJKd4=
X-Received: by 2002:a05:6808:6d93:b0:571:4e99:7942 with SMTP id
 5614622812f47-57a0b65aeb8mr10461764b6e.48.1795383056189; Sun, 22 Nov 2026
 13:30:56 -0800 (PST)
X-Mailing-List: linux-wireless@vger.kernel.org
List-Id: <linux-wireless.vger.kernel.org>
List-Post: <mailto:linux-wireless@vger.kernel.org>
List-Help: <mailto:linux-wireless+help@vger.kernel.org>
List-Subscribe: <mailto:linux-wireless+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-wireless+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-wireless+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Gaston Guevara <guevara.gaston@gmail.com>
Date: Sun, 22 Nov 2026 18:30:44 -0300
X-Gm-Features: Aa3M54oFOo4KR4Sug1gfwNW4veKddWWYoYhfaSRukJnhgJC0CIGjDczqofXM5rg
Message-ID: <CABMxrRyvsFy7qGXky-OF1KE3c04z0xO_XMGnJC28L0WHE9AF9Q@mail.gmail.com>
Subject: [BUG] ath9k: WARN in ieee80211_beacon_cntdwn_is_complete() on every
 CSA when AP and STA share a radio (ath9k_csa_update() visits the STA vif)
To: linux-wireless@vger.kernel.org
Cc: toke@toke.dk, johannes@sipsolutions.net
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On an ath9k radio running an AP and a station vif on the same channel,
every channel switch announced by the upstream AP makes the kernel print
about nine WARNINGs from ieee80211_beacon_cntdwn_is_complete(), roughly
one every 200 ms for about two seconds. I think ath9k_csa_is_finished()
is being called for the station interface, and I'd like to ask whether a
vif-type check there is the right fix.

Setup
- Hardware: TP-Link Archer C60 v3, QCA9561 (ath9k) 2.4 GHz radio: one AP
  (phy1-ap0) plus one STA (phy1-sta0) on the same phy, same channel. The
  5 GHz radio (ath10k) is a separate phy and not involved.
- Software: OpenWrt SNAPSHOT r38494, Linux 6.18.64 with the OpenWrt
  mac80211 backports (kmod-ath9k-6.18.64.7.2-r16). The kernel is
  therefore tainted O (out-of-tree modules). hostapd and wpa_supplicant
  are the OpenWrt builds. I have not reproduced this on a vanilla
  kernel, but the relevant code is identical in v6.12 and v6.18.
- panic_on_warn=3D0.

How to trigger
The STA is associated to a consumer router that changes channel every
20-60 minutes, announcing it with a CSA plus an ECSA element (operating
class 12). mac80211 logs "cannot understand ECSA IE operating class,
12, ignoring" and follows the CSA. The AP on the same phy follows through
hostapd. Observed on 2026-11-20 22:33:18, 2026-11-21 11:38:58 and
2026-11-21 16:26:52 (router local time); each time the WARN burst starts
before the switch completes.

What the kernel prints (one of the ~9 per event, trimmed)

WARNING: CPU: 0 PID: 7 at net/mac80211/tx.c:5648
ieee80211_beacon_cntdwn_is_complete+0xac/0x160 [mac80211]
CPU: 0 UID: 0 PID: 7 Comm: kworker/0:0H Tainted: G O 6.18.64 #0 NONE
Hardware name: TP-Link Archer C60 v3
Call Trace:
[<8006cd18>] show_stack+0x28/0xf0
[<800662a4>] dump_stack_lvl+0x4c/0x80
[<8008aa54>] __warn+0x9c/0x118
[<800611d4>] warn_slowpath_fmt+0x5c/0xac
[<82241438>] ieee80211_beacon_cntdwn_is_complete+0xac/0x160 [mac80211]
[<82780360>] 0x82780360

The PID and task vary between WARNs (hostapd, logread, kworkers), so
this looks like an interrupt/softirq context, not a process doing
something wrong. The module base was 0x82780000 in this boot, so the
caller is ath9k + 0x360. In an earlier boot the base differed but the
offset was the same (0x360).

Resolving the caller
ath9k.ko from the same build has a R_MIPS_26 relocation to
ieee80211_beacon_cntdwn_is_complete at .text+0x358 (a jal, so the return
address is 0x360). That function, which sits just before
ath9k_beacon_assign_slot, also calls ieee80211_csa_finish at
.text+0x384. There are only three calls to
ieee80211_beacon_cntdwn_is_complete in the module (+0x358, +0x72c inside
the out-of-line ath9k_csa_is_finished, and +0xb70 inside
ath9k_beacon_tasklet). This matches ath9k_csa_update_vif() with
ath9k_csa_is_finished() inlined. I confirmed this by building the same
module from the same sources: its .text is byte-identical to the one on
the device, and addr2line places .text+0x358 in ath9k_csa_is_finished()
(beacon.c:368), inlined into ath9k_csa_update_vif() (beacon.c:378).

Analysis
In v6.18 (and v6.12), ath9k_csa_is_finished() is:

bool ath9k_csa_is_finished(struct ath_softc *sc, struct ieee80211_vif *vif)
{
        if (!vif || !vif->bss_conf.csa_active)
                return false;

        if (!ieee80211_beacon_cntdwn_is_complete(vif, 0))
                return false;

        ieee80211_csa_finish(vif, 0);
        return true;
}

and ath9k_csa_update() visits every active interface:

ieee80211_iterate_active_interfaces_atomic(sc->hw, IEEE80211_IFACE_ITER_NOR=
MAL,
                                           ath9k_csa_update_vif, sc);

mac80211's ieee80211_beacon_cntdwn_is_complete() only knows AP, ADHOC
and MESH_POINT vifs; for any other type it reaches else { WARN_ON(1);
goto out; }. mac80211 sets bss_conf.csa_active on a station vif while it
processes a channel switch from its AP
(ieee80211_sta_process_chanswitch() does link->conf->csa_active =3D true).
So, while the upstream CSA is in progress, ath9k_csa_update() calls
ath9k_csa_is_finished() for the STA vif, csa_active is true, and the
WARN fires on each pass, which would explain the periodic burst that
starts before the switch completes. I checked the exact sources used for
this build: tx.c:5648 is the WARN_ON(1); in that final else branch, not
the WARN_ON(!beacon || !beacon->tail) one.

Proposed change (RFC, tested on the device)
Skip station vifs in ath9k_csa_is_finished() (indentation below is
spaces because of my mail client; the source uses tabs):

--- a/drivers/net/wireless/ath/ath9k/beacon.c
+++ b/drivers/net/wireless/ath/ath9k/beacon.c
@@ bool ath9k_csa_is_finished(struct ath_softc *sc, struct ieee80211_vif *v=
if)
 {
- if (!vif || !vif->bss_conf.csa_active)
+ if (!vif || vif->type =3D=3D NL80211_IFTYPE_STATION ||
+ !vif->bss_conf.csa_active)
                 return false;

I excluded only NL80211_IFTYPE_STATION rather than requiring
NL80211_IFTYPE_AP, so that ad-hoc and mesh keep their current behaviour.
If you would rather fix it in mac80211 (e.g. make
ieee80211_beacon_cntdwn_is_complete() return false for non-beaconing
types without warning), I'm happy to test that instead. I have now
tested the ath9k change on the device: with the patched module loaded,
twelve consecutive upstream channel switches (2026-11-21 19:38 to
2026-11-22 09:03, router local time) produced no WARNING at all, whereas
without the patch all five switches I had logged produced them. This is
one router, one upstream AP, and the module is an out-of-tree build of
the same sources, so it is not a statistical statement, but the warnings
are gone. The patch does not stop the -EBUSY station disconnect that
sometimes follows the same CSA (it still happened in four of those
twelve switches); that is a separate problem, which I am reporting in
its own thread on this list ("mac80211: station is disconnected on an
upstream CSA (-EBUSY from ieee80211_vif_use_reserved_switch()) ...").

Background
On OpenWrt 23.05.3 (kernel 5.15) the same kind of WARN was hit (at
tx.c:5103 in that tree) and the router rebooted after several CSAs. I
have no log of what caused that reboot, so I'm not claiming a link.

I can provide the full dmesg of the three events, the exact ath9k.ko,
and test patches on this hardware.

Thanks,
Gast=C3=B3n

--=20
Gaston Guevara
