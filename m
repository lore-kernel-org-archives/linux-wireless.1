Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795527147;
	b=VY6rCWicbyK2xs2uPTtElzsD4JC/rX+w7f9UCbiTi6CLxwenVgQEFw1F1Se2uAUOZVTT
	 XTBYGvzJq8rEMw943/q1AhlLEXFnD9hHN+F8yzpHeBdSfMB6tXlCO2aXscR6MtF1Tdh7R
	 QxYAZOLuH7LQCNs22mOOVfKLlm5V1XoZMJfsJRqg0UKf3FElrHU2MMnsS6vkdmEWg73q1
	 fOJjmDOUCS/zSgeJyQqkfJbd+bbHYG2JziLklSEMxztkSefvAtd2IoLYLZ/46OPEXl6IF
	 TQhbvLtlvqcwryN37BNvBb/sebmawShM/8f7prpQ0nVM1kd36BGqz2wpM9iMDT9mqWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795527147;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding;
	bh=DIVDZ1wEHc2STLkJiNFUS5xOQF60Z9p9ysmGGJ5+1vs=;
	b=jKOFNejZkC/vWLjhEUqSVpmkFmvTEcXhQhJtyiElDztvtasGsAEOhOskeSlwarKkhr2H
	 tBkeFt452Wrq0Kes8fCB7dGes4tLE0GYGC8uO/N1jzC+f1EqISazojzoQTr2Urp3ql3Ib
	 7lrkg6r+3uo+X5q8ot+Y8smDIcduhkdIi/AatKtsa3hgnr/l9YNcGs8KCXsPlwjNSWwmx
	 Pvc17NvXU0d5e5+Fa20DFoAhJjw3k1EWiRyEaxqPtpc8PD2EpZJObuyXCIQNXD8B1gVIr
	 vOq7G036Hk0/Vy0siIGJIZ0VHFJBlOrUjT83QL+ddbxcV1CykHOF6S1to3Q4nPX33Bw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="rjEA/gL4";
	arc=none smtp.remote-ip=209.85.214.173
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89BFC606A321
	for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 13:32:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 89BFC606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rjEA/gL4
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2f0621eec70so28184395ad.2
        for <linux-wireless@vger.kernel.org>; Tue, 24 Nov 2026 05:32:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795527146; x=1796131946; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DIVDZ1wEHc2STLkJiNFUS5xOQF60Z9p9ysmGGJ5+1vs=;
        b=rjEA/gL4MDmY/P52YdMFVrfh1EY471koAhHoiiEJYWfMSHBWfZTH5ZcLkLgWHTGVeG
         Gy9b3CJR4fxGenQIl66w3uJmK45qOlyJIWn47lpggw3RKIAaxDCr0zaqoEURDE6G72tg
         aSilYVAR9THF7DHwCkb4XUd9zOAiI+2jHuJ+7sTExEOLg8aX6nWX6kzNiEJprDzGLhzx
         P5hYgIuffiSo8OGU34cP8Auk7F45WPYM0KsTHO+GYdWNUof7deDZk5s8iyKcrl9kJIrD
         8cDnbke1w22edG6Ctb+Ty6z+tQyv5u6hPyIlSIV6koMFIAFyT7x6Gv+8uOxF7vYdH4aq
         aGsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795527146; x=1796131946;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DIVDZ1wEHc2STLkJiNFUS5xOQF60Z9p9ysmGGJ5+1vs=;
        b=wJZquPInCgzQ4SA2hFpxl9tFGUX5ZXxA2KH92n9cYG9RkcY4kixxxR5ErYlTde4bnZ
         QzgosWDXVLIQaU5wiOtmTblrCcTXuoUbNjYvXFrUeQN2X1RNELZEioAFNwN1ezSpEb/D
         ltIF6GFd5YnvBg/gp9rCtIL5BYNxS6mN3uDcb72LvUaz7RkMhFcKXyG5gvHkfkR6WgEc
         DiuEWPp4YyMej+lQiksqx8/NvnBB1biS4B9miaXJv1G/qZzHPN083FL5A1JReHldrm1m
         QIw9RY0ypeZeP0b0NH1uA/vFDRUy3r4vGP9Kzj7Xz7jCkxKjnYqLc6NYjcGyJ+qUjctM
         kx3g==
X-Forwarded-Encrypted: i=1; AL+hErGE+HOQJCgnZIK4p+l/gWb8VUseOQtxYKtsUeSM7EaZidIB2dBepp/9tKyYlTdY9pI4b8+cKL9GZiTd0M+50w==@vger.kernel.org
X-Gm-Message-State: APuU4Z+MTsx8UZC6fFgsmq2C5cugT+PU5iCANfMbkcQ3rsH/w3+XIdze
	LIZmZbaP0dyUDDcFpMapDYv6yYnWUbDjer6fMJFgDQuyXFNRqXukvhCg
X-Gm-Gg: AZFdTZfgR9ffqrr72Ppsi8ZhbpU32fLLzfug8Fe+3J4RYygETEeVUvp6VYI0ld+TmIG
	p79+s50oZoXiZEOm9/q8YA+7icqrHkDxnAex7sZ/+gVb4tHg34p4bAM6kN9Cl8fgIPt8La2cwP1
	L3Qx6RajSY/BD6uVDKNGierOpBPBsE0xKoidJc6I903JMgpwnn7veByUBAOa+TcUWiOLx5aQan+
	ttQtoBCQOxdTLXJg3elo9mldVcnof17Po6hZyHTa3UakfAj4jy3UQ2A4xQRxcdq9rn2FmVcLSdF
	e8HOLoMlS8d7PjdnYAxnK4PGfrNjNW1eH7bkHXNQdptDUarSi+XjMwaGgK7bFlbxon3MaPh96KA
	REeSOHX1q2ElwvFgNHKAUE4LldB4w53RDYz9Q8HTCPM0MWtGW456JhyWXLtOA2ONEpXdKmxAakJ
	nN2Sunaz9yKETEPBurBKeThobaz5Oe72Clz8FZRJyxu8RCyyEv4wC1jFgzwdGACeTOv325mS+iA
	Lvox32I5XHskNcM1VOB8gOxHRD/EIkDys9EDl+WbohbgMvys4TRenmkMODoq/A3NlwrLgniLav8
	p7U4vbOEaBiH38PdomKWI5DYdg9qNMmk+f4fcxJzJ1QqVfzFkXSiLcUtcUqQAO0PfaTz
X-Received: by 2002:a17:903:98b:b0:2df:aed3:2ac0 with SMTP id d9443c01a7336-2f03f1cf5ccmr159419765ad.10.1795527145788;
        Tue, 24 Nov 2026 05:32:25 -0800 (PST)
Received: from d20be28ee783.tail196be.ts.net (vldb.skku.ac.kr. [115.145.173.180])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f118c72sm69571505ad.54.2026.11.24.05.32.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 05:32:25 -0800 (PST)
From: Kyuwon Cho <kyuwoncho18@gmail.com>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: John Crispin <john@phrozen.org>,
	Aloka Dixit <quic_alokad@quicinc.com>,
	Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
	linux-wireless@vger.kernel.org
Subject: [PATCH wireless] wifi: mac80211: clear the MBSSID options when starting an AP fails
Date: Tue, 24 Nov 2026 22:32:21 +0900
Message-ID: <179552107132.1345245.6487482796651760102@gmail.com>
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

ieee80211_start_ap() applies the MBSSID configuration with
ieee80211_set_ap_mbssid_options() before it takes the channel. If
ieee80211_link_use_channel() or a later step fails, the error paths
restore the beacon interval and the SSID length but leave
link_conf->tx_bss_conf and the other MBSSID fields set. cfg80211 does
not consider the AP started, so STOP_AP does not clear them either.

A retry with the same MBSSID configuration then fails with -EALREADY
until the interface goes down, and a start without MBSSID succeeds but
keeps the stale transmitting BSS.

Clear the MBSSID options on both error paths.

Fixes: 171964252189 ("mac80211: MBSSID support in interface handling")
Signed-off-by: Kyuwon Cho <kyuwoncho18@gmail.com>
---
The issue was found by an LLM-guided test generator that we are
developing as a research prototype. A reproducer, which runs as any
user with mac80211_hwsim loaded: it creates a one-channel radio with
two AP interfaces, starts wlan0 as the transmitting BSS of an MBSSID
set, and then starts ap1 as a nontransmitted BSS, first on another
channel and then on wlan0's.

#define _GNU_SOURCE
#include <linux/genetlink.h>
#include <linux/nl80211.h>
#include <net/if.h>
#include <sched.h>
#include <stdint.h>
#include <stdio.h>
#include <string.h>
#include <sys/ioctl.h>
#include <sys/socket.h>
#include <unistd.h>

#define HWSIM_CMD_NEW_RADIO			4
#define HWSIM_ATTR_CHANNELS			9
#define HWSIM_ATTR_DESTROY_RADIO_ON_CLOSE	16

static int fd;
static unsigned char req[1024], *p;

static void msg(int family, int cmd)
{
	memset(req, 0, sizeof(req));
	((struct nlmsghdr *)req)->nlmsg_type = family;
	((struct nlmsghdr *)req)->nlmsg_flags = NLM_F_REQUEST | NLM_F_ACK;
	((struct genlmsghdr *)NLMSG_DATA(req))->cmd = cmd;
	((struct genlmsghdr *)NLMSG_DATA(req))->version = 1;
	p = req + NLMSG_LENGTH(GENL_HDRLEN);
}

static struct nlattr *attr(int type, const void *data, int len)
{
	struct nlattr *a = (void *)p;

	a->nla_type = type;
	a->nla_len = NLA_HDRLEN + len;
	if (len)
		memcpy(a + 1, data, len);
	p += NLA_ALIGN(a->nla_len);
	return a;
}

static void u32(int type, uint32_t v)
{
	attr(type, &v, 4);
}

/* returns the ack's error; copies attribute "want" of a reply to "out" */
static int talk(int want, void *out)
{
	static char buf[8192];
	struct nlmsghdr *nh = (void *)req;
	int n;

	nh->nlmsg_len = p - req;
	send(fd, req, nh->nlmsg_len, 0);
	for (;;) {
		n = recv(fd, buf, sizeof(buf), 0);
		for (nh = (void *)buf; NLMSG_OK(nh, n); nh = NLMSG_NEXT(nh, n)) {
			struct nlattr *a = (void *)((char *)NLMSG_DATA(nh) + GENL_HDRLEN);
			int rem = nh->nlmsg_len - NLMSG_LENGTH(GENL_HDRLEN);

			if (nh->nlmsg_type == NLMSG_ERROR)
				return ((struct nlmsgerr *)NLMSG_DATA(nh))->error;
			for (; rem >= NLA_HDRLEN && a->nla_len >= NLA_HDRLEN;
			     rem -= NLA_ALIGN(a->nla_len), a = (void *)((char *)a + NLA_ALIGN(a->nla_len)))
				if (a->nla_type == want)
					memcpy(out, a + 1, a->nla_len - NLA_HDRLEN);
		}
	}
}

static int family(const char *name)
{
	uint16_t id = 0;

	msg(GENL_ID_CTRL, CTRL_CMD_GETFAMILY);
	attr(CTRL_ATTR_FAMILY_NAME, name, strlen(name) + 1);
	talk(CTRL_ATTR_FAMILY_ID, &id);
	return id;
}

static void up(const char *name)
{
	struct ifreq ifr = { .ifr_flags = IFF_UP };
	int s = socket(AF_INET, SOCK_DGRAM, 0);

	strcpy(ifr.ifr_name, name);
	ioctl(s, SIOCSIFFLAGS, &ifr);
	close(s);
}

/* START_AP as part of an MBSSID set whose transmitting BSS is wlan0 */
static int start_ap(int nl80211, const char *name, int freq, uint8_t index)
{
	static const unsigned char ie[] = { 0, 4, 'm', 'b', 's', 's',
		1, 8, 0x82, 0x84, 0x8b, 0x96, 0x0c, 0x12, 0x18, 0x24 }, mbssid[] = { 71, 1, 1 };
	unsigned char head[36 + sizeof(ie)] = { 0x80 };
	struct ifreq ifr = {};
	struct nlattr *nest;
	int s = socket(AF_INET, SOCK_DGRAM, 0);

	strcpy(ifr.ifr_name, name);
	ioctl(s, SIOCGIFHWADDR, &ifr);
	close(s);
	memset(head + 4, 0xff, 6);
	memcpy(head + 10, ifr.ifr_hwaddr.sa_data, 6);
	memcpy(head + 16, ifr.ifr_hwaddr.sa_data, 6);
	head[32] = 100;		/* beacon interval */
	head[34] = 1;		/* ESS */
	memcpy(head + 36, ie, sizeof(ie));

	msg(nl80211, NL80211_CMD_START_AP);
	u32(NL80211_ATTR_IFINDEX, if_nametoindex(name));
	u32(NL80211_ATTR_WIPHY_FREQ, freq);
	u32(NL80211_ATTR_BEACON_INTERVAL, 100);
	u32(NL80211_ATTR_DTIM_PERIOD, 2);
	attr(NL80211_ATTR_BEACON_HEAD, head, sizeof(head));
	attr(NL80211_ATTR_SSID, "mbss", 4);
	nest = attr(NL80211_ATTR_MBSSID_CONFIG | NLA_F_NESTED, NULL, 0);
	attr(NL80211_MBSSID_CONFIG_ATTR_INDEX, &index, 1);
	u32(NL80211_MBSSID_CONFIG_ATTR_TX_IFINDEX, if_nametoindex("wlan0"));
	nest->nla_len = p - (unsigned char *)nest;
	if (!index) {
		nest = attr(NL80211_ATTR_MBSSID_ELEMS | NLA_F_NESTED, NULL, 0);
		attr(1, mbssid, sizeof(mbssid));
		nest->nla_len = p - (unsigned char *)nest;
	}
	return talk(-1, NULL);
}

int main(void)
{
	struct sockaddr_nl sa = { .nl_family = AF_NETLINK };
	uint32_t wiphy = 0;
	int hwsim, nl80211;

	/* CAP_NET_ADMIN over a radio of our own */
	if (unshare(CLONE_NEWUSER | CLONE_NEWNET))
		return perror("unshare"), 1;
	fd = socket(AF_NETLINK, SOCK_RAW, NETLINK_GENERIC);
	bind(fd, (void *)&sa, sizeof(sa));
	hwsim = family("MAC80211_HWSIM");
	nl80211 = family("nl80211");

	/* a radio with one channel: a second AP cannot use another one */
	msg(hwsim, HWSIM_CMD_NEW_RADIO);
	u32(HWSIM_ATTR_CHANNELS, 1);
	attr(HWSIM_ATTR_DESTROY_RADIO_ON_CLOSE, NULL, 0);
	talk(-1, NULL);
	while (!if_nametoindex("wlan0"))
		usleep(10000);

	msg(nl80211, NL80211_CMD_GET_INTERFACE);
	u32(NL80211_ATTR_IFINDEX, if_nametoindex("wlan0"));
	talk(NL80211_ATTR_WIPHY, &wiphy);
	msg(nl80211, NL80211_CMD_SET_INTERFACE);
	u32(NL80211_ATTR_IFINDEX, if_nametoindex("wlan0"));
	u32(NL80211_ATTR_IFTYPE, NL80211_IFTYPE_AP);
	talk(-1, NULL);
	msg(nl80211, NL80211_CMD_NEW_INTERFACE);
	u32(NL80211_ATTR_WIPHY, wiphy);
	attr(NL80211_ATTR_IFNAME, "ap1", 4);
	u32(NL80211_ATTR_IFTYPE, NL80211_IFTYPE_AP);
	talk(-1, NULL);
	up("wlan0");
	up("ap1");

	printf("wlan0, transmitting BSS, 2412 MHz: %s\n", strerror(-start_ap(nl80211, "wlan0", 2412, 0)));
	printf("ap1, nontransmitted BSS, 2437 MHz: %s\n", strerror(-start_ap(nl80211, "ap1", 2437, 1)));
	printf("ap1, nontransmitted BSS, 2412 MHz: %s\n", strerror(-start_ap(nl80211, "ap1", 2412, 1)));
	return 0;
}

Without the patch, the last start fails with EALREADY ("Operation
already in progress"); with it, it succeeds.

The patch was written with LLM assistance; we reviewed and tested it.

 net/mac80211/cfg.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/net/mac80211/cfg.c b/net/mac80211/cfg.c
index 9608c07bcea7..4ca5246527cf 100644
--- a/net/mac80211/cfg.c
+++ b/net/mac80211/cfg.c
@@ -162,6 +162,15 @@ static int ieee80211_set_mon_options(struct ieee80211_sub_if_data *sdata,
 	return 0;
 }
 
+static void ieee80211_clear_ap_mbssid_options(struct ieee80211_bss_conf *link_conf)
+{
+	RCU_INIT_POINTER(link_conf->tx_bss_conf, NULL);
+	link_conf->bssid_index = 0;
+	link_conf->nontransmitted = false;
+	link_conf->ema_ap = false;
+	link_conf->bssid_indicator = 0;
+}
+
 static int ieee80211_set_ap_mbssid_options(struct ieee80211_sub_if_data *sdata,
 					   struct cfg80211_mbssid_config *params,
 					   struct ieee80211_bss_conf *link_conf)
@@ -1937,6 +1946,7 @@ static int ieee80211_start_ap(struct wiphy *wiphy, struct net_device *dev,
 		ieee80211_link_copy_chanctx_to_vlans(link, false);
 	if (err) {
 		link_conf->beacon_int = prev_beacon_int;
+		ieee80211_clear_ap_mbssid_options(link_conf);
 		return err;
 	}
 
@@ -2055,6 +2065,7 @@ static int ieee80211_start_ap(struct wiphy *wiphy, struct net_device *dev,
 	link_conf->beacon_int = prev_beacon_int;
 	sdata->vif.cfg.ssid_len = 0;
 	ieee80211_link_release_channel(link);
+	ieee80211_clear_ap_mbssid_options(link_conf);
 
 	return err;
 }
-- 
2.43.0

